echo "Resetting ambari-server"
sudo ambari-server stop
sudo ambari-server reset -s
sudo ambari-agent stop

echo "Removing Installed Packages"
sudo yum remove -y hadoop_2_3_0_0_2557.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-hdfs.x86_64
sudo yum remove -y ranger_2_3_0_0_2557-hdfs-plugin.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-yarn.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-mapreduce.x86_64
sudo yum remove -y hdp-select.noarch
sudo yum remove -y tez_2_3_0_0_2557.noarch
sudo yum remove -y ranger_2_3_0_0_2557-yarn-plugin.x86_64
sudo yum remove -y zookeeper_2_3_0_0_2557.noarch
sudo yum remove -y bigtop-jsvc.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-hdfs-journalnode.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-yarn-nodemanager.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-yarn-timelineserver.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-doc.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-mapreduce-historyserver.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-client.x86_64
sudo yum remove -y bigtop-tomcat.noarch
sudo yum remove -y hadoop_2_3_0_0_2557-hdfs-zkfc.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-httpfs-server.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-hdfs-namenode.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-hdfs-fuse.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-yarn-resourcemanager.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-source.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-hdfs-datanode.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-yarn-proxyserver.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-hdfs-secondarynamenode.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-conf-pseudo.x86_64
sudo yum remove -y hadoop_2_3_0_0_2557-httpfs.x86_64

echo "Removing Users"
sudo killall -KILL -u ambari-qa
sudo userdel -r ambari-qa
sudo killall -KILL -u hdfs
sudo userdel -r hdfs
sudo killall -KILL -u mapred
sudo userdel -r mapred
sudo killall -KILL -u tez
sudo userdel -r tez
sudo killall -KILL -u yarn
sudo userdel -r yarn
sudo killall -KILL -u zookeeper
sudo userdel -r zookeeper

echo "Removing Unwanted Folders"
sudo rm -rf /etc/hadoop
sudo rm -rf /etc/zookeeper
sudo rm -rf /etc/tez
sudo rm -rf /var/run/hadoop
sudo rm -rf /var/run/zookeeper
sudo rm -rf /var/run/hadoop-yarn
sudo rm -rf /var/run/hadoop-mapreduce
sudo rm -rf /var/log/hadoop
sudo rm -rf /var/log/zookeeper
sudo rm -rf /var/log/hadoop-yarn
sudo rm -rf /var/log/hadoop-mapreduce
sudo rm -rf /var/lib/hadoop-hdfs
sudo rm -rf /tmp/hadoop-hdfs
sudo rm -rf /hadoop/zookeeper
sudo rm -rf /hadoop/yarn

sudo yum remove -y ambari-server
sudo yum remove -y ambari-agent
