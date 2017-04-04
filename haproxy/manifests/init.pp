class haproxy(

$haproxy_group = $haproxy::params::haproxy_group,
$haproxy_user = $haproxy::params::haproxy_user,
$haproxy_archive_deb = $haproxy::params::haproxy_archive_deb,

)

inherits haproxy::params
{
#---------------------------------------------
file { "/opt/liblua5.3-0_5.3.1-1ppa1~trusty_amd64.deb":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/haproxy/liblua5.3-0_5.3.1-1ppa1~trusty_amd64.deb",
                mode => 0755,

        }->



        package { "extract_haproxy_archive_deb1":
                provider => dpkg,
                ensure => installed,
                source => "/opt/liblua5.3-0_5.3.1-1ppa1~trusty_amd64.deb",
        }->
#--------------------------------------------




file { "/opt/${haproxy_archive_deb}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/haproxy/${haproxy_archive_deb}",
                mode => 0755,

        }->

	

        package { "extract_haproxy_archive_deb":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${haproxy_archive_deb}",
#               notify => Service['haproxy'],

        }->

	exec {"run_haproxy_config_setting":,
                command => "/bin/sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy",
        }->
	
	
        file { 'haproxy Config File':
                path => "/etc/haproxy/haproxy.cfg",
                ensure  => file,
                mode => 0777,
                content => template('haproxy/haproxy.cfg.erb'),
	     }->
#------------------------

        file {"copy_edit_haproxy_config_script1":
                        path => "/opt/edit_haproxy_config.sh",
                        ensure => "present",
#                        owner =>"${elasticsearch_user}",
#                        group =>"${elasticsearch_group}",
                        mode => "0777",
                        source => "puppet:///modules/haproxy/edit_haproxy_config.sh",

        }->

        file {"copy_edit_haproxy_config_input1":
                        path => "/opt/redis_ip_all_x.txt",
                        ensure => "present",
#                        owner =>"${elasticsearch_user}",
#                        group =>"${elasticsearch_group}",
                        mode => "0777",
                        source => "puppet:///modules/haproxy/redis_ip_all_x.txt",

        }->

        exec {"run_edit_haproxy_config_script1":
#                       user => "${elasticsearch_user}",
                        command => "/bin/bash /opt/edit_haproxy_config.sh",
#                        require => File["elasticsearch_cluster_input"]

                   }->

        service {'haproxy':
                ensure => running,
                enable => true
        }

}
