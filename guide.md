build vpc + 2 subnets, private and public.

connect to ec2 public, uploaded key pair.
make sure inbound ssh for 22 is correct.

ssh -i "aws.pem" ec2-user@ec2-34-227-106-182.compute-1.amazonaws.com

front machine:
update - sudo yum update -y
install git - sudo yum install git -y
install node 14 - https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
nvm install 14
update
bring repo

backend:
update
install docker
run postgres image
