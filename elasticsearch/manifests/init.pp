class elasticsearch (
   
    $elasticsearch_archive = $elasticsearch::params::elasticsearch_archive,
    $elasticsearch_dir = $elasticsearch::params::elasticsearch_dir,
    $elasticsearch_user = $elasticsearch::params::elasticsearch_user,
    $elasticsearch_group = $elasticsearch::params::elasticsearch_group,
    $elasticsearch_user_pwd = $elasticsearch::params::elasticsearch_user_pwd,
    $cluster_name = $elasticsearch::params::cluster_name,
    $test_test = $elasticsearch::params::test_test
    )
inherits elasticsearch::params
  { 
  
          group { "${elasticsearch_group}":
                        ensure => "present",
                  }-> 
   
            user { "${elasticsearch_user}":
                        groups     => ["${elasticsearch_group}"],
			home       => "/home/elastic",
       			managehome => true,
       
	         }->


	 augeas { 'sudoelastic':
        	context => '/files/etc/sudoers',
        	changes => [
        	"set spec[user = \"elastic\"]/user \"elastic\"",
        	"set spec[user = \"elastic\"]/host_group/host ALL",
        	"set spec[user = \"elastic\"]/host_group/command ALL",
        	"set spec[user = \"elastic\"]/host_group/command/runas_user ALL",
        	]
       	 	} ->

     
   
  
             file {'download archive':
                      path => "/opt/${elasticsearch_archive}",
                      ensure => present,
                      source => "puppet:///modules/elasticsearch/${elasticsearch_archive}",
                      owner => root,
                      mode => 0755
                 }->	
   
             file {"${elasticsearch_dir}":
	               ensure => directory,
	               owner => "${elasticsearch_user}",
	               group => "${elasticsearch_group}",	
	               mode => 0644
	          }->
            
             exec { "extract elasticsearch":
	                command => "/bin/tar -zxvf ${elasticsearch_archive} -C ${elasticsearch_dir} && chown -R ${elasticsearch_user}:${elasticsearch_group} ${elasticsearch_dir}/*",
                        cwd => "/opt",
                        require => File["download archive"]
                  }->  

             file {"elasticsearch_script":
                        path => "${elasticsearch_dir}/elasticsearch.sh",
                        ensure => "present",
                        owner =>"${elasticsearch_user}",
                        group =>"${elasticsearch_group}",
                        mode => "0777",
                        source => "puppet:///modules/elasticsearch/elasticsearch.sh",
                  }->

		file {"elasticsearch_config_script":
                        path => "${elasticsearch_dir}/config_setting.sh",
                        ensure => "present",
                        owner =>"${elasticsearch_user}",
                        group =>"${elasticsearch_group}",
                        mode => "0777",
                        source => "puppet:///modules/elasticsearch/config_setting.sh",
                  }->
		file {"elasticsearch_cluster_input":
                        path => "${elasticsearch_dir}/file.txt",
                        ensure => "present",
                        owner =>"${elasticsearch_user}",
                        group =>"${elasticsearch_group}",
                        mode => "0777",
                        source => "puppet:///modules/elasticsearch/file.txt",
		     }->

	     file { 'Elaticsearch Config File':
        		path => "/opt/elastic_dir/elasticsearch-2.3.5/config/elasticsearch.yml",
        		ensure  => file,
        		mode => 0777,
       			content => template('elasticsearch/elasticsearch.yml.erb'),

        	  }->

#		file {"sleep_script":
#                        path => "${elasticsearch_dir}/sleep.sh",
#                        ensure => "present",
#                        owner =>"${elasticsearch_user}",
#                        group =>"${elasticsearch_group}",
#                        mode => "0777",
#                        source => "puppet:///modules/elasticsearch/sleep.sh",
#
#
#		     }->
#		 exec {"sleep":
#                        user => "${elasticsearch_user}",
#                       command => "/bin/sh ${elasticsearch_dir}/sleep.sh",
#		
#			}->
	      exec {"run_config_setting":
                       user => "${elasticsearch_user}",
                        command => "/bin/bash ${elasticsearch_dir}/config_setting.sh",
                        require => File["elasticsearch_cluster_input"]

		   }->
             exec {"elasticsearch":
                        user => "${elasticsearch_user}",
                        command => "/bin/sh ${elasticsearch_dir}/elasticsearch.sh",
                        require => File["elasticsearch_script"]
                   }
  } 
