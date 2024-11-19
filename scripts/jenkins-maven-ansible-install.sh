#!/bin/bash

############################################################################
### Installing jenkins
# Ensure that your software packages are up to date on your instance by using the following command to perform a quick software update
sudo yum update -y

### Jenkins Installation
# Add the Jenkins repo in the cache
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import a key file from Jenkins-CI to enable installation from the package and upgrade packages
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y

# Install Java (Amazon Linux 2023) ********
sudo yum install java-17-amazon-corretto -y #sudo amazon-linux-extras install java-openjdk11 -y

# Install Jenkins:
sudo yum install jenkins -y

# Enable the Jenkins service to start at boot:
sudo systemctl enable jenkins

# Start Jenkins as a service
sudo systemctl start jenkins


############################################################################
### Installing Maven to work with Jenkins

# Add a repository with a Maven package
sudo wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo

# set the version number for the packages
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo

# install Maven.
sudo yum install -y apache-maven



############################################################################
### Installing Ansible to work with Jenkins

# Install the package
sudo amazon-linux-extras install ansible2 -y

# Create Ansible user called ansadmin
sudo useradd ansadmin
sudo passwd ansadmin
sudo echo ansadmin:ansadmin | chpasswd
sudo sed -i "s/.*PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config

# Restarting the service
sudo service sshd restart

# Updating the user ansadmin
sudo echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sudo service sshd restart
sudo usermod -aG wheel ansadmin

# Installing and enabling Tomcat
sudo amazon-linux-extras install tomcat8.5 -y
sudo systemctl enable tomcat
sudo systemctl start tomcat


# Change the hostname of the Ec2 Sever
sudo hostnamectl set-hostname Maven_jenkins_ansible
