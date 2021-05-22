echo "Deploy script started"
cd /var/www/html/maxtechtesting
git reset --hard
git pull origin master
robot Test.robot
echo "Deploy script finished execution"