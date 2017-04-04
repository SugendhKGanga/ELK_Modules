class filebeat(

$filebeat_pkg = $filebeat::params::filebeat_pkg,

)

inherits filebeat::params
{
        file { "/opt/${filebeat_pkg}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/filebeat/${filebeat_pkg}",
                mode => 0755,
                                
        }->

        package { "extract_filebeat_pkg":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${filebeat_pkg}",
#               notify => Service['filebeat'],

        }->
	
	file { 'filebeat Config File':
                        path => "/etc/filebeat/filebeat.yml",
                        ensure  => file,
                        mode => 0777,
                        content => template('filebeat/filebeat.yml.erb'),

	}->

	file {"copy_edit_config_script1":
                        path => "/opt/edit_config.sh",
                        ensure => "present",
#                        owner =>"${elasticsearch_user}",
#                        group =>"${elasticsearch_group}",
                        mode => "0777",
                        source => "puppet:///modules/filebeat/edit_config.sh",

	}->
	
	file {"copy_edit_config_input1":
                        path => "/opt/haproxy_input.txt",
                        ensure => "present",
#                        owner =>"${elasticsearch_user}",
#                        group =>"${elasticsearch_group}",
                        mode => "0777",
                        source => "puppet:///modules/filebeat/haproxy_input.txt",

        }->

	exec {"run_edit_config_script1":
#                       user => "${elasticsearch_user}",
                       command => "/bin/bash /opt/edit_config.sh",
#                        require => File["elasticsearch_cluster_input"]

                   }->


        service {'filebeat':
                ensure => running,
                enable => true
        }

}

