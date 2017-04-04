class haproxy(

$haproxy_group = $haproxy::params::haproxy_group,
$haproxy_user = $haproxy::params::haproxy_user,
$haproxy_archive_deb = $haproxy::params::haproxy_archive_deb,

)

inherits haproxy::params
{
	group { "${haproxy_group}":
		ensure => present,
	}->

	user { "${haproxy_user}":
		ensure => present,
		groups => "${haproxy_group}"
	}->

	file { "/opt/${haproxy_archive_deb}":
		ensure =>present,
		owner => "${haproxy_user}",
		group => "${haproxy_group}",
		source => "puppet:///modules/haproxy/${haproxy_archive_deb}",
		mode => 0755
	}->

	package { "extract_haproxy_archive_deb":
		provider => dpkg,
		ensure => installed,
		source => "/opt/${haproxy_archive_deb}", 
#		notify => Service['haproxy'],

	}->

#	 file { 'enable haproxy':
#		path => "/etc/default/haproxy",
#		ensure  => file,
#		mode => 0777,
#		content => template('haproxy/haproxy.erb'),
#	}->


	exec {"run_config_setting":,
		command => "/bin/sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy",
        }->


	service {'haproxy':
		ensure => running,
		enable => true
	}
	

}
