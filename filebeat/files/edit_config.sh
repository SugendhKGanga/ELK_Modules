#!/bin/bash
#haproxy_server=`cat haproxy_input.txt`
#echo "$haproxy_server"
#sed -i 's/ENABLED=0/ENABLED=1/g' /etc/filebeat/filebeat.yml

filename=/opt/haproxy_input.txt
declare -a myArray
myArray=(`cat "$filename"`)

for (( i = 0 ; i < 2 ; i++))
do
  echo "Element [$i]: ${myArray[$i]}"
done

echo ${myArray[0]}		#haproxy ip
echo ${myArray[1]}              #haproxy port
#export A="${myArray[0]}"
#echo $A


#sed -i "s/haproxy_server_ip/${A}/g" /etc/filebeat/filebeat.yml
#sed -i 's/haproxy_port/${myArray[1]}/g' /etc/filebeat/filebeat.yml
sed -i "s/haproxy_server_ip/${myArray[0]}/g" /etc/filebeat/filebeat.yml
sed -i "s/haproxy_port/${myArray[1]}/g" /etc/filebeat/filebeat.yml
