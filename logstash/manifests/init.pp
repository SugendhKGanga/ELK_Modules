class logstash(

$logstash_pkg = $logstash::params::logstash_pkg,

)

inherits logstash::params
{
        file { "/opt/${logstash_pkg}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/logstash/${logstash_pkg}",
                mode => 0755,
                                
        }->

        package { "extract_logstash_pkg":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${logstash_pkg}",
#               notify => Service['logstash'],

        }->
	
        file {"copy create_logstash_config_file.sh":
                        path => "/opt/create_logstash_config_file.sh",
                        ensure => "present",
                        mode => "0777",
                        source => "puppet:///modules/logstash/create_logstash_config_file.sh",

        }->

        file {"copy_edit_logstash_config_input1":
                        path => "/opt/redis_ip_all.txt",
                        ensure => "present",
                        mode => "0777",
                        source => "puppet:///modules/logstash/redis_ip_all.txt",

        }->
        file {"copy_edit_logstash_config_output1":
                        path => "/opt/elasticsearch_ip.txt",
                        ensure => "present",
                        mode => "0777",
                        source => "puppet:///modules/logstash/elasticsearch_ip.txt",

        }->



        exec {"create logstash config file":
                        command => "/bin/bash /opt/create_logstash_config_file.sh",

                   }->



        service {'logstash':
                ensure => running,
                enable => true
        }


}

