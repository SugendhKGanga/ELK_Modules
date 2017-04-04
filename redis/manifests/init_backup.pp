class redis::install_master {

$ismaster = "true"

#	include postgresql::repo
	include redis::setup
	include redis::start_services

}
class redis::install_slave {

$ismaster = "false"

#  	include postgresql::repo
	include redis::setup
	include redis::configure_slave
	include redis::start_services
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
               command => "/opt/redis_dir/redis-3.2.8/src/redis-server /usr/local/bin/redis.conf &",
             }->

 exec { "run sentinel":
               command => "/opt/redis_dir/redis-3.2.8/src/redis-server /opt/redis_dir/redis-3.2.8/sentinel.conf --sentinel &",
             }
}
