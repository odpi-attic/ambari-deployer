echo "******************************************************************************************"
echo "Executing WGET to get Repo"
echo "******************************************************************************************"
sudo wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.1.0/ambari.repo
echo "******************************************************************************************"
echo "Moving Repo to /etc/yum.repos.d/"
echo "******************************************************************************************"
sudo mv ambari.repo /etc/yum.repos.d/
echo "******************************************************************************************"
echo "Installing ambari-server"
echo "******************************************************************************************"
sudo yum install ambari-server -y
echo "******************************************************************************************"
echo "Resetting ambari-server"
echo "******************************************************************************************"
sudo ambari-server reset -s
echo "******************************************************************************************"
echo "Setup ambari-server"
echo "******************************************************************************************"
sudo ambari-server setup -s
echo "******************************************************************************************"
echo "Starting ambari-server"
echo "******************************************************************************************"
sudo ambari-server start

if [[ $# > 0 ]]; then
        if [[ $# = 2 ]]; then
                if [ $1 == "-pem" ]; then
                        sec="pem"
                        key=$2
echo "******************************************************************************************"
echo "Using pem file authentication"
echo "******************************************************************************************"

                fi
        fi
fi

echo "******************************************************************************************"
echo "Commence installation and start of ambari-agents"
echo "******************************************************************************************"
USERNAME=ec2-user
#HOSTS="10.188.73.104 10.188.73.105 10.188.73.106"
HOSTFILE=hosts
SERVERHOST=$(hostname -f)
SCRIPT="sudo wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.1.0/ambari.repo; sudo mv ambari.repo /etc/yum.repos.d/; sudo yum install ambari-agent -y; sudo chmod 777 /etc/ambari-agent/conf/ambari-agent.ini; sudo sed s/localhost/$SERVERHOST/ /etc/ambari-agent/conf/ambari-agent.ini > ambari-agent.ini.tmp; sudo mv ambari-agent.ini.tmp /etc/ambari-agent/conf/ambari-agent.ini; sudo chmod 755 /etc/ambari-agent/conf/ambari-agent.ini; sudo ambari-agent start"
for HOSTNAME in `cat ${HOSTFILE}` ; do
echo "******************************************************************************************"
echo "Installing Agent in"
echo $HOSTNAME
echo "******************************************************************************************"

        if [ $sec == "pem" ]; then
                sudo ssh -tt -o StrictHostKeyChecking=no -i $key -l ${USERNAME} ${HOSTNAME} "${SCRIPT}" &
        else
                sudo ssh -o -o StrictHostKeyChecking=no -tt ${HOSTNAME} "${SCRIPT}" &
        fi
done

wait

echo "******************************************************************************************"
echo "Deploying Blueprint and Cluster"
echo "******************************************************************************************"

echo "******************************************************************************************"
echo "Upload blueprint"
echo "******************************************************************************************"
curl -H "X-Requested-By: ambari" -X POST -d @BluePrint.txt -u admin:admin http://localhost:8080/api/v1/blueprints/SampleBlueprintCluster

echo "******************************************************************************************"
echo "Start Clueprint Configured Cluster for hosts"
echo "******************************************************************************************"
curl -H "X-Requested-By: ambari" -X POST -d @ClusterConfig.txt -u admin:admin http://localhost:8080/api/v1/clusters/ClusterFromBlueprint


echo "******************************************************************************************"
echo "Ambari and Service Deployment Completed Successfully!!!"
echo "******************************************************************************************"
