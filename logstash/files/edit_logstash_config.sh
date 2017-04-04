#!/bin/bash

filename=/opt/logstash_config_input.txt
declare -a myArray2
myArray2=(`cat "$filename"`)

for (( i = 0 ; i < 2 ; i++))
do
  echo "Element [$i]: ${myArray2[$i]}"
done

echo ${myArray2[0]}		#redis server ip
echo ${myArray2[1]}              #redis port
#echo ${myArray2[2]}		#backend bk_redis ip
#echo ${myArray[3]}		#backend bk_redis port

sed -i "s/redis_server_ip/${myArray2[0]}/g" /etc/logstash/conf.d/logstash.conf
sed -i "s/redis_port/${myArray2[1]}/g" /etc/logstash/conf.d/logstash.conf
#sed -i "s/bk_redis_ip/${myArray1[2]}/g" /etc/logstash/conf.d/logstash.conf
#sed -i "s/bk_redis_port/${myArray1[3]}/g" /etc/logstash/conf.d/logstash.conf

