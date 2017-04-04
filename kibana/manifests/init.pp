class kibana(

#$haproxy_group = $haproxy::params::haproxy_group,
#$haproxy_user = $haproxy::params::haproxy_user,
$kibana_archive_deb = $kibana::params::kibana_archive_deb,

)

inherits kibana::params
{

file { "/opt/${kibana_archive_deb}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/kibana/${kibana_archive_deb}",
                mode => 0755,

        }->

        package { "extract_kibana_archive_deb":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${kibana_archive_deb}"
#               notify => Service['kibana'],

	}->        

#	exec {"run_config_setting":,
#                command => "/bin/sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy",
#        }->
	
	
       file { 'kibana Config File':
                path => "/opt/kibana/config/kibana.yml",
               ensure  => file,
                mode => 0777,
                content => template('kibana/kibana.yml.erb'),
	     }->

	

        service {'kibana':
                ensure => running,
                enable => true
        }

}
