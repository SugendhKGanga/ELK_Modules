#!/bin/bash

filename=/opt/redis_ip_all.txt
declare -a myArray3
myArray3=(`cat "$filename"`)

x=`cat /opt/redis_ip_all.txt | wc -l`
echo $x
number_of_redis_nodes=$((x - 1))
echo $number_of_redis_nodes

echo "input {" > /etc/logstash/conf.d/logstash.conf
for (( i = 0 ; i < $x ; i++))
do
  echo "Element [$i]: ${myArray3[$i]}"
#  echo server redis_$i ${myArray3[$i]}:6379 check inter 1s >> output
  echo '  redis {
    host => "'${myArray3[$i]}'"
    port => "6379"
    type => "redis-input"
    data_type => "list"
    key => "redis"
  }' >> /etc/logstash/conf.d/logstash.conf
done
echo "}" >> /etc/logstash/conf.d/logstash.conf


filename=/opt/elasticsearch_ip.txt
declare -a myArray4
myArray4=(`cat "$filename"`)

y=`cat /opt/elasticsearch_ip.txt | wc -l`
echo $y
number_of_redis_nodes=$((y - 1))
echo $number_of_es_nodes


echo "output {" >> /etc/logstash/conf.d/logstash.conf
for (( i = 0 ; i < $y ; i++))
do
  echo "Element [$i]: ${myArray4[$i]}"
#  echo server redis_$i ${myArray3[$i]}:6379 check inter 1s >> output
  echo "  elasticsearch {" >> /etc/logstash/conf.d/logstash.conf
  echo '    hosts => ["'${myArray3[$i]}':9200"]' >> /etc/logstash/conf.d/logstash.conf
  echo "    manage_template => false" >> /etc/logstash/conf.d/logstash.conf
  echo '    index => "filebeat-%{+YYYY.MM.dd}"' >> /etc/logstash/conf.d/logstash.conf
  echo '    document_type => "%{[@metadata][type]}"' >> /etc/logstash/conf.d/logstash.conf
  echo "  }" >> /etc/logstash/conf.d/logstash.conf
done
echo "}" >> /etc/logstash/conf.d/logstash.conf

