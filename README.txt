# ambari-deployer
Code used for deploying ODP reference implementation via Ambari

Steps to deploy the cluster 
Basic assumption is that the infrastructure is available. 
Step 1: Download "AmbariOneClick_Updated_VerboseLogs.zip" and upload to your cluster. 
Step 2: Unzip "AmbariOneClick_Updated_VerboseLogs.zip" 
Step 3: Go to "/AmbariOneClick/installer/" directory 
Step 4: Edit "hosts" file to change the default IP addresses of the hosts to reflect your cluster. 
Step 5: Edit "ClusterConfig.txt" file to edit "host_group_1" to specify the masters and "host_group_2" with slaves. The IP addresses for the hosts and the slaves should be fully qualified. 
Step 6: Run command "chmod 600" on your pem file. It is assumed that the pem files will be available in the "/AmbariOneClick/installer/" directory. 
Step 7: Run command "bash install.sh -pem "ClusterConfig.txt" file to edit "host_group_1" to specify the masters and "host_group_2" to specify the slaves.
Step 8: Once the install is complete, login to the browser based Ambari Dashboard which can be accessed port 8080 of the master node. The login and password for the Ambari dashboard is admin and the password is admin.

Steps to uninstall the cluster
Step 1: Go to "/AmbariOneClick/uninstaller/" directory.
Step 2: Edit "hosts" file to change the default IP addresses of the hosts to reflect your cluster. 
Step 3: Edit "ClusterConfig.txt" file to edit "host_group_1" to specify the masters and "host_group_2" with slaves. The IP addresses for the hosts and the slaves should be fully qualified.
Step 4: Run command "chmod 600" on your pem file. It is assumed that the pem files will be available in the "/AmbariOneClick/uninstaller/" directory.
Step 5: Run command "bash uninstall.sh -pem "ClusterConfig.txt" file to edit "host_group_1" to specify the masters and "host_group_2" to specify the slaves. 
Step 6: Once the uninstall is complete, browser based Ambari Dashboard should become inaccessible.


