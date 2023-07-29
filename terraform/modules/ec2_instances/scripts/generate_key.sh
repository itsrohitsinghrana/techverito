#!/bin/bash

# Generate PEM key for Jenkins server
ssh-keygen -t rsa -b 2048 -f jenkins_key.pem -q -N ""

# Generate PEM key for Deployment server
ssh-keygen -t rsa -b 2048 -f deployment_key.pem -q -N ""

# Move PEM keys to the desired directory
mv jenkins_key.pem deployment_key.pem /modules/ec2_instances/pem_key/
