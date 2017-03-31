#!/bin/bash
# script to pull my current public IP address 
# and add a rule to my EC2 security group allowing me SSH access 
curl v4.ifconfig.co > ip.txt
awk '{ print $0 "/32" }' < ip.txt > ipnew.txt
export stuff=$(cat ipnew.txt)
aws ec2 authorize-security-group-ingress --group-name NewGroup \
 --protocol tcp --port 22 --cidr $stuff
