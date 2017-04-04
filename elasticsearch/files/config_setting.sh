#!/bin/bash

filename=/opt/elastic_dir/file.txt
declare -a myArray
myArray=(`cat "$filename"`)

for (( i = 0 ; i < 20 ; i++))
do
  echo "Element [$i]: ${myArray[$i]}"
done


ip=`ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1`
#ip=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`


if [[ " ${myArray[*]} " == *" $ip "* ]]

#if [[ " ${myArray[*]} " ==  $ip  ]]
	then
    		echo "This is a master node"
		sed -i 's/master_node_variable/true/g' /opt/elastic_dir/elasticsearch-2.3.5/config/elasticsearch.yml
#		echo $ip > /opt/elastic_dir/ip.txt
	else
		echo "This is not a master node"
		sed -i 's/master_node_variable/false/g' /opt/elastic_dir/elasticsearch-2.3.5/config/elasticsearch.yml
#		echo $ip > /opt/elatic_dir/ip1.txt
fi
