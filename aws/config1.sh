key="*.pem"
scp ~/.ssh/$key .
scp ~/.ssh/$key /root
#ls
store=instance
echo "[remote]" > $store
REMOTE="$(./ec2.py --refresh --list | grep -A2 tag_Name_demo_new1 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')"
loca="/home/ubuntu"
echo $REMOTE >> $store
scp -i *.pem -oStrictHostKeyChecking=no -r project ubuntu@$REMOTE:$loca
