#!/bin/bash
aws ec2 disassociate-address --association-id eipassoc-48429a77
aws ec2 release-address --allocation-id eipalloc-9474e1a9
aws ec2 terminate-instances --instance-ids i-0764bbdd21e30f1b6
aws ec2 wait instance-terminated --instance-ids i-0764bbdd21e30f1b6
aws ec2 delete-security-group --group-id sg-c13d5bbc
aws ec2 disassociate-route-table --association-id rtbassoc-be3e1ec6
aws ec2 delete-route-table --route-table-id rtb-41cd4c38
aws ec2 detach-internet-gateway --internet-gateway-id igw-74fad913 --vpc-id vpc-d5c691b3
aws ec2 delete-internet-gateway --internet-gateway-id igw-74fad913
aws ec2 delete-subnet --subnet-id subnet-8e3883c6
aws ec2 delete-vpc --vpc-id vpc-d5c691b3
echo If you want to delete the key-pair, please do it manually.
