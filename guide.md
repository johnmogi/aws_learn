creating and partitioning a vpc into 2 subnets:
https://cidr.xyz/
10.0.128.0/26 - vpc (64 available ips)
10.0.128.0/28 - back (16 available ips)
10.0.128.16/28 - front (16 available ips)

build vpc + 2 subnets,( private and public).
create route table and connect to 2 subnets
created elastic ip

create 2 ec2 connect each to its subnet

connect to ec2 public, uploaded key pair.
make sure inbound ssh for 22 is correct.
also check unfder security group outbound to 80 from all

ssh -i "aws.pem" ec2-user@ec2-34-227-106-182.compute-1.amazonaws.com

front:
yum update -y
yum install git -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bashcurl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 14

backend:
make sure the aws.pem is copied coerrectly-
https://serverfault.com/questions/379938/ec2-instance-always-ask-me-to-enter-passphrase-for-the-pem-during-connection
openssl rsa -check -in test.pem -noout
It should say "RSA key ok"

update
https://serverfault.com/questions/836198/how-to-install-docker-on-aws-ec2-instance-with-ami-ce-ee-update

install docker - sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
docker pull postgres:latest
check outbound

be user data:
sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
docker pull postgres:latest

run postgres image
