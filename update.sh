#!/bin/bash
# script to pull my current public IP address
# and add a rule to my EC2 security group allowing me SSH access
aws ec2 authorize-security-group-ingress \
--group-name NewGroup \
 --protocol tcp \
--port 22 \
--cidr "$(curl -s v4.ifconfig.co)/32"
