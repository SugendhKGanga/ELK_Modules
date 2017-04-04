#!/bin/bash

filename=/opt/redis_master.txt
declare -a myArray
myArray=(`cat "$filename"`)

for (( i = 0 ; i < 1 ; i++))
do
  echo "Element [$i]: ${myArray[$i]}"
done


ip=`ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1`
#ip=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`


if [[ " ${myArray[*]} " == *" $ip "* ]]

#if [[ " ${myArray[*]} " ==  $ip  ]]
        then
                echo "This is a master node"
		sed -i 's/master_node_ip_variable/'${myArray[0]}'/g' /opt/redis_dir/redis-3.2.8/sentinel.conf
        else
                echo "This is not a master node"
                sed -i 's/master_node_ip_variable/'${myArray[0]}'/g' /opt/redis_dir/redis-3.2.8/redis.conf
		sed -i 's/master_node_ip_variable/'${myArray[0]}'/g' /opt/redis_dir/redis-3.2.8/sentinel.conf
fi
