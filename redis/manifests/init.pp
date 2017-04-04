class redis::install_master {

$ismaster = "true"
	include 
	 "redis::setup",
	 "redis::start_services"
	        Class['redis::setup']  ~> Class['redis::start_services']

}
class redis::install_slave {

$ismaster = "false"
	include	
		"redis::setup",
		"redis::configure_slave",
		"redis::start_services"
	
			Class['redis::setup'] ~> Class['redis::configure_slave'] ~> Class['redis::start_services'] 
}

class redis::dependancies {
	require redis::params
	
	$redis_archive_tar = $redis::params::redis_archive_tar
        $redis_dir = $redis::params::redis_dir
        $redis_user = $redis::params::redis_user
        $redis_group = $redis::params::redis_group
        $make_redis_deb = $redis::params::make_redis_deb

        $dependancy_deb1 = $redis::params::dependancy_deb1
        $dependancy_deb2 = $redis::params::dependancy_deb2
        $dependancy_deb3 = $redis::params::dependancy_deb3
        $dependancy_deb4 = $redis::params::dependancy_deb4
        $dependancy_deb5 = $redis::params::dependancy_deb5
        $dependancy_deb6 = $redis::params::dependancy_deb6
        $dependancy_deb7 = $redis::params::dependancy_deb7
        $dependancy_deb8 = $redis::params::dependancy_deb8
        $dependancy_deb9 = $redis::params::dependancy_deb9
        $dependancy_deb10 = $redis::params::dependancy_deb10
        $dependancy_deb11 = $redis::params::dependancy_deb11
        $dependancy_deb12 = $redis::params::dependancy_deb12
        $dependancy_deb13 = $redis::params::dependancy_deb13

	file { "/opt/${dependancy_deb1}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb1}",
                mode => 0755,

        	}->
        file { "/opt/${dependancy_deb2}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb2}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb3}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb3}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb4}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb4}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb5}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb5}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb6}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb6}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb7}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb7}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb8}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb8}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb9}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb9}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb10}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb10}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb11}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb11}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb12}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb12}",
                mode => 0755,

                }->
        file { "/opt/${dependancy_deb13}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${dependancy_deb13}",
                mode => 0755,

                }->






	package { "dependancy_deb1":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb1}"
        	}->
        package { "dependancy_deb2":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb2}"
                }->
        package { "dependancy_deb3":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb3}"
                }->
        package { "dependancy_deb4":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb4}"
                }->
        package { "dependancy_deb5":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb5}"
                }->
        package { "dependancy_deb6":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb6}"
                }->
        package { "dependancy_deb7":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb7}"
                }->
        package { "dependancy_deb7":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb7}"
                }->
        package { "dependancy_deb8":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb8}"
                }->
        package { "dependancy_deb9":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb9}"
                }->
        package { "dependancy_deb10":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb10}"
                }->
        package { "dependancy_deb11":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb11}"
                }->
        package { "dependancy_deb12":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb12}"
                }->
        package { "dependancy_deb13":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${dependancy_deb13}"
                }


}





class redis::setup {
       require redis::params

#      $postgresql_archive_1 = $::postgresql::params::postgresql_archive_1
#      $postgresql_archive_2 = $::postgresql::params::postgresql_archive_2
#      $postgresql_archive_3 = $::postgresql::params::postgresql_archive_3

	$redis_archive_tar = $redis::params::redis_archive_tar
	$redis_dir = $redis::params::redis_dir
	$redis_user = $redis::params::redis_user
	$redis_group = $redis::params::redis_group
	$make_redis_deb = $redis::params::make_redis_deb
 
	 group { "${redis_group}":
         ensure => "present",
         }->

         user { "${redis_user}":
                 groups     => ["${redis_group}"],
                 home       => "/home/redis",
                 managehome => true,

         }->


        file { "/opt/${redis_archive_tar}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${redis_archive_tar}",
                mode => 0755,

        }->


        file {"${redis_dir}":
                ensure => directory,
                owner => "${redis_user}",
                group => "${redis_group}",
                mode => 0644
        }->


#------------------------------
file { "/opt/${make_redis_deb}":
                ensure =>present,
                owner => root,
                group => root,
                source => "puppet:///modules/redis/${make_redis_deb}",
                mode => 0755,

        }->

package { "make_redis_deb":
                provider => dpkg,
                ensure => installed,
                source => "/opt/${make_redis_deb}"
#               notify => Service['nginx'],
	}->
#------------------------------

        exec { "extract redis":
                command => "/bin/tar -zxvf ${redis_archive_tar} -C ${redis_dir} && chown -R ${redis_user}:${redis_group} ${redis_dir}/*",
                cwd => "/opt",
#                require => File["download archive"]
             }->


        exec { "make redis":
               command => "/usr/bin/make MALLOC=libc",
               cwd => "/opt/redis_dir/redis-3.2.8",
             }->

# exec { "cp redis1":
#               command => "/bin/cp src/redis-server /usr/local/bin/",
#               cwd => "/opt/redis_dir/redis-3.2.8",
#             }->

 exec { "cp redis2":
               command => "/bin/cp src/redis-cli /usr/local/bin/",
               cwd => "/opt/redis_dir/redis-3.2.8",
             }->

# exec { "cp redis3":
#               command => "/bin/cp redis.conf /usr/local/bin",
#               cwd => "/opt/redis_dir/redis-3.2.8",
#             }->
 file { 'redis Config File':
                        path => "/opt/redis_dir/redis-3.2.8/redis.conf",
                        ensure  => file,
			owner =>"${redis_user}",
                        group =>"${redis_group}",
                        mode => 0777,
                        content => template('redis/redis.conf.erb'),
        }->


        file { 'redis sentinel':

                        path => "/opt/redis_dir/redis-3.2.8/sentinel.conf",
                        ensure  => file,
                        mode => 0777,
                        content => template('redis/sentinel.conf.erb'),

        }

}

class redis::configure_slave {
       require redis::params

#      $postgresql_archive_1 = $::postgresql::params::postgresql_archive_1
#      $postgresql_archive_2 = $::postgresql::params::postgresql_archive_2
#      $postgresql_archive_3 = $::postgresql::params::postgresql_archive_3

        $redis_archive_tar = $redis::params::redis_archive_tar
        $redis_dir = $redis::params::redis_dir
        $redis_user = $redis::params::redis_user
        $redis_group = $redis::params::redis_group

#-------
                file {"edit_redis master ip _script":
                        path => "/opt/sed_master_ip.sh",
                        ensure => "present",
                        owner =>"${redis_user}",
                        group =>"${redis_group}",
                        mode => "0777",
                        source => "puppet:///modules/redis/sed_master_ip.sh",
                  }->
                file {"redis master ip input":
                        path => "/opt/redis_master.txt",
                        ensure => "present",
                        owner =>"${redis_user}",
                        group =>"${redis_group}",
                        mode => "0777",
                        source => "puppet:///modules/redis/redis_master.txt",

		}->
#----
 exec {"run_redis_config_setting":
                       user => "${redis_user}",
                        command => "/bin/bash /opt/sed_master_ip.sh",
#                        require => File["elasticsear"]
	}
}


class redis::start_services {
       require redis::params

#      $postgresql_archive_1 = $::postgresql::params::postgresql_archive_1
#      $postgresql_archive_2 = $::postgresql::params::postgresql_archive_2
#      $postgresql_archive_3 = $::postgresql::params::postgresql_archive_3

        $redis_archive_tar = $redis::params::redis_archive_tar
        $redis_dir = $redis::params::redis_dir
        $redis_user = $redis::params::redis_user
        $redis_group = $redis::params::redis_group


#----
 exec { "run redis":
               command => "/opt/redis_dir/redis-3.2.8/src/redis-server /opt/redis_dir/redis-3.2.8/redis.conf &",
             }->

 exec { "run sentinel":
               command => "/opt/redis_dir/redis-3.2.8/src/redis-server /opt/redis_dir/redis-3.2.8/sentinel.conf --sentinel &",
             }
}
