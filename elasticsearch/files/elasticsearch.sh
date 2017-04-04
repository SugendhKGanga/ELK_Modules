count=$(ps -ef | grep elasticsearch-2.3.5 | wc -l)
if [ $count -gt 1 ]; then
pid=$(ps -ef | grep elasticsearch-2.3.5 | awk '{print $2}' | head -1)
kill -9 $pid
/opt/elastic_dir/elasticsearch-2.3.5/bin/elasticsearch &
echo " elastic search already runnning"
else
/opt/elastic_dir/elasticsearch-2.3.5/bin/elasticsearch &
fi
