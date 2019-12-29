# Terraform 
Launch AWS EC2 instance using terraform.

$cd Lvl1/terraform

update the main.tf file with AWS access_key and secret_key

initialize working directory with terraform init 

$terraform init

terraform plan command is used to create an execution plan

$terraform plan

create the EC2 instance by using following command.

$terraform apply

It will generate pem file nginx.pem which will used for EC2 authentication.
The public ip address of EC2 will be printed in the terraform output. 
we need to update ip address in inventory file of Ansible(Lvl1/ansible/inventory).

# Ansible 
Run ansible playbook to deploy the helloworld app in nginx.

$cd Lvl1/ansible

$ ansible-playbook -i inventory playbook.yml

This playbook will install nginx and deploy the helloworld app in Nginx.
To verify paste the public ip address of ec2 instnace in bowser and will get hello world page.

# Docker

Step 1: Create Docker Image

$cd Lvl1/docker

$docker build -t nginx:latest .

verify the docker image by running the following command

$docker images

login to docker hub and push docker image.

$docker login --username="DOCKER USERNAME"

$docker tag "DOCKER IMAGE ID" "DOCKER USERNAME"/nginx:nginxserver

$docker push "DOCKER USERNAME"/mynginx

Create containers using docker compose

 update docker image ID in docker compose file as "DOCKER USERNAME"/nginx:nginxserver

To start the container.

$docker-compose up -d

To delete the container.

docker-compose down






