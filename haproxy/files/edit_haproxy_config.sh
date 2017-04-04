#!/bin/bash

filename=/opt/redis_ip_all_x.txt
declare -a myArray3
myArray3=(`cat "$filename"`)

x=`cat /opt/redis_ip_all.txt | wc -l`
echo $x
number_of_redis_nodes=$((x - 1))
echo $number_of_redis_nodes

#echo "#redis servers" > output
for (( i = 0 ; i < $x ; i++))
do
  echo "Element [$i]: ${myArray3[$i]}"
#  echo ${myArray3[$i]} >> output
  echo server redis_$i ${myArray3[$i]}:6379 check inter 1s >> /etc/haproxy/haproxy.cfg

done


