# v1

## Makes What?

- EC2
    - hello-cloud-rails:
        - Docker image
        - SQLite db (local)
        - Puma application server

## Pre-requisites

- Docker is installed and started (local Terminal commands executed in Docker Quickstart Terminal)
- Docker Hub account is created and logged into
- Git is installed
- AWS account is created

## Create App Server AMI

1. Locally, run the following Terminal commands
    ```shell
    $ git clone https://github.com/plusjeff/hello-cloud-rails.git
    $ cd hello-cloud-rails
    $ git checkout v1
    $ docker build -t plusjeff/hello-cloud-rails:1 . # change your Docker username if following along
    $ docker push plusjeff/hello-cloud-rails:1
    ```
1. Login to AWS
1. Go to EC2
1. Go to Key Pairs
1. Go to Create Key Pair
1. Give the Key Pair a name (`hello-cloud-dev`), then download the file
1. On your local machine, move the file to ~/.ssh
1. On your local machine, run the command: `ssh-add ~/.ssh/hello-cloud-dev.pem`
1. Go to Security Groups
1. Create a security group
    - Name: hello-cloud-rails-app-server
    - Inbound Rules
        - SSH
            - Type: SSH
        - HTTP
            - Type: HTTP
    - Outbound Rule
        - Type: All traffic
1. Go to Instances
1. Go to Launch Instance
1. Choose ami-60b6c60a
    - Name: Amazon Linux AMI 2015.09.1 (HVM), SSD Volume Type
    - Description: The Amazon Linux AMI is an EBS-backed, AWS-supported image. The default image includes AWS command line tools, Python, Ruby, Perl, and Java. The repositories include Docker, PHP, MySQL, PostgreSQL, and other packages
    - Root Device Type: EBS
    - Virtualization: hvm
1. Choose Instance Type: t2.micro
1. Use defaults for everything else on the Instance creation, except:
    - Choose `hello-cloud-rails-app-server` as the Security Group
    - Choose `hello-cloud-dev` as the key pair
1. Wait for the instance to startup
1. Go to Instances
1. Copy the Public IP for the Instance
1. On your local machine, SSH to the Instance: `ssh ec2-user@(ip)`
1. On the Instance ([following instructions](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html)):
    ```shell
    $ sudo yum -y update
    $ sudo yum -y install docker
    $ sudo service docker start
    $ exit # leaving the AWS Instance
    ```
1. Go to Instances
1. Stop the Instance being used (and wait for it to stop)
1. Choose Actions, choose Images > Create Image
1. Name it `aws-linux-docker`
1. Go to AMIs and wait for the image to be created (this is creating an AMI so that we can easily launch another instance pre-app installation)
1. Got to Instances
1. Start the Instance we had just shut down
1. Get the Instance's Public IP
1. On your local machine, SSH to the instance `ssh ec2-user@(ip)`
1. On the Instance, add the following to `/etc/rc.local`:
    ```shell
    sudo -u ec2-user docker run -p 80:3000 plusjeff/hello-cloud-rails:1
    ```
1. Back in the AWS Console, stop the Instance
1. Go to Instances
1. Stop the Instance being used (and wait for it to stop)
1. Choose Actions, choose Images > Create Image
1. Name it `hello-cloud-rails-v1`

## Create CloudFormation script

_In progress_
