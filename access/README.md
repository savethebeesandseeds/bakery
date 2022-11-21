# Connectiong instructions
chmod 400 access/bakery.pem
sudo ssh -i "access/bakery.pem" ec2-user@ec2-34-205-77-169.compute-1.amazonaws.com
scp -i "access/bakery.pem" build/imu.imux  ec2-user@ec2-34-205-77-169.compute-1.amazonaws.com:/home/ec2-user/bakery
request with: http://ec2-34-205-77-169.compute-1.amazonaws.com:8888/