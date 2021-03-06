# Start the flink cluster
# jobmanager.sh start cluster
echo "Configuring Job Manager on this node"
sed -i -e "s/%jobmanager%/`hostname -i`/g" /usr/local/flink/conf/flink-conf.yaml
/usr/local/flink/bin/jobmanager.sh start cluster #local #cluster
echo "Cluster started."
#sleep infinity
# Start the web client -- for newest version of Flink is integrated on Flink Dashboard
#/usr/local/flink/bin/start-webclient.sh

#mkdir -p $FLINK_MASTER_LOG

echo "Config file: " && grep '^[^\n#]' /usr/local/flink/conf/flink-conf.yaml
echo "Sleeping 10 seconds, then start to tail the log file"
sleep 10 && tail -f `ls /usr/local/flink/log/*.log | head -n1`

#tail -f /usr/local/flink/log/flink--jobmanager-flink.log
#tail -f `find /usr/local/flink/log/ -name *jobmanager*.out`

