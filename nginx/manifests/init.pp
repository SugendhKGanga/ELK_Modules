class nginx(

#$haproxy_group = $haproxy::params::haproxy_group,
#$haproxy_user = $haproxy::params::haproxy_user,
#$nginx_archive_deb = $kibana::params::kibana_archive_deb,

$nginx_archive_deb1 = $nginx::params::nginx_archive_deb1,
$nginx_archive_deb2 = $nginx::params::nginx_archive_deb2,
$nginx_archive_deb3 = $nginx::params::nginx_archive_deb3,
$nginx_archive_deb4 = $nginx::params::nginx_archive_deb4,
$nginx_archive_deb5 = $nginx::params::nginx_archive_deb5,
$nginx_archive_deb6 = $nginx::params::nginx_archive_deb6,
$nginx_archive_deb7 = $nginx::params::nginx_archive_deb7,
$nginx_archive_deb8 = $nginx::params::nginx_archive_deb8,
$nginx_archive_deb9 = $nginx::params::nginx_archive_deb9,
$nginx_archive_deb10 = $nginx::params::nginx_archive_deb10,
$nginx_archive_deb11 = $nginx::params::nginx_archive_deb11,
$nginx_archive_deb12 = $nginx::params::nginx_archive_deb12,
$nginx_archive_deb13 = $nginx::params::nginx_archive_deb13,
$nginx_archive_deb14 = $nginx::params::nginx_archive_deb14,
)

inherits nginx::params
{

file { "/opt/${nginx_archive_deb1}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb1}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb2}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb2}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb3}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb3}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb4}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb4}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb5}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb5}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb6}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb6}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb7}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb7}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb8}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb8}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb9}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb9}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb10}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb10}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb11}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb11}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb12}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb12}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb13}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb13}",
                mode => 0755,

        }->

file { "/opt/${nginx_archive_deb14}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/nginx/${nginx_archive_deb14}",
                mode => 0755,

        }->

package { "install_nginx_archive_deb1":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb1}"
#               notify => Service['nginx'],

        }->


package { "install_nginx_archive_deb2":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb2}"
#               notify => Service['nginx'],

        }->
package { "install_nginx_archive_deb3":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb3}"
#               notify => Service['nginx'],

        }->
package { "install_nginx_archive_deb4":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb4}"
#               notify => Service['nginx'],

        }->
package { "install_nginx_archive_deb5":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb5}"
#               notify => Service['nginx'],

        }->
package { "install_nginx_archive_deb6":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb6}"
#               notify => Service['nginx'],

        }->
package { "install_nginx_archive_deb7":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb7}"
#               notify => Service['nginx'],

        }->
package { "install_nginx_archive_deb8":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb8}"
#               notify => Service['nginx'],

        }->
package { "install_nginx_archive_deb9":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb9}"
#               notify => Service['nginx'],

        }->



        package { "install_nginx_archive_deb10":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb10}"
#               notify => Service['nginx'],

	}->
        package { "install_nginx_archive_deb11":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb11}"
#               notify => Service['nginx'],

        }->
        package { "install_nginx_archive_deb12":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb12}"
#               notify => Service['nginx'],

        }->
        package { "install_nginx_archive_deb13":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb13}"
#               notify => Service['nginx'],

        }->
        
	package { "install_nginx_archive_deb14":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${nginx_archive_deb14}"
#               notify => Service['nginx'],

        }->

#	exec {"create kibana user":,
#                command => "/bin/sed  sudo htpasswd -cb /etc/nginx/htpasswd.users kibanaadmin admin",
#        }->
	
	
#        file { 'nginx Config File':
#                path => "/etc/nginxsdfsdf/kibana.yml",
#                ensure  => file,
#                mode => 0777,
#                content => template('kibana/kibana.yml.erb'),
#	     }->
	 file { 'nginx Config File':
                        path => "/etc/nginx/sites-available/default",
                        ensure  => file,
                        mode => 0777,
                        content => template('nginx/default.erb'),

	}->	
	
	 exec {"create kibana user ":
                        user => "root",
                        command => "/usr/bin/htpasswd -b -c /etc/nginx/htpasswd.users kibanaadmin admin",
#
	}->
        service {'nginx':
                ensure => running,
                enable => true
        }

}
