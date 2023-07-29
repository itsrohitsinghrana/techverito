#!/bin/bash

# Update the system
sudo apt update -y
sudo apt upgrade -y

#!/bin/bash
apt update -y
apt install -y docker.io
service docker start
docker pull jenkins/jenkins
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins
