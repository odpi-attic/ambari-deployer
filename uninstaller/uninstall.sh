echo "******************************************************************************************"
echo "Beginning uninstall process"
echo "******************************************************************************************"


if [[ $# > 0 ]]; then
        if [[ $# = 2 ]]; then
                if [ $1 == "-pem" ]; then
                        sec="pem"
                        key=$2
                        echo "******************************************************************************************"
                        echo "Using pem file for Authentication"
                        echo "******************************************************************************************"

                fi
        fi
fi

USERNAME=ec2-user
HOSTFILE=hosts
SCRIPT="bash removeShell.sh; sudo rm removeShell.sh"
for HOSTNAME in `cat ${HOSTFILE}` ; do
        echo "******************************************************************************************"
        echo "Removing files, packages and users from"
        echo $HOSTNAME
        echo "******************************************************************************************"

        if [ $sec == "pem" ]; then
                sudo scp -o StrictHostKeyChecking=no -i $key removeShell.sh $USERNAME@$HOSTNAME:
                sudo ssh -o StrictHostKeyChecking=no -tt -i $key -l ${USERNAME} ${HOSTNAME} "${SCRIPT}" &
        else
                sudo scp -o StrictHostKeyChecking=no removeShell.sh $USERNAME@$HOSTNAME:
                sudo ssh -o StrictHostKeyChecking=no -tt ${HOSTNAME} "${SCRIPT}" &
        fi
done
wait
echo "******************************************************************************************"
echo "Uninstall Complete"
echo "******************************************************************************************"
