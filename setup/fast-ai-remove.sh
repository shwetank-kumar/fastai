#!/bin/bash
aws ec2 disassociate-address --association-id eipassoc-8c31fab3
aws ec2 release-address --allocation-id eipalloc-cb44caf6
aws ec2 terminate-instances --instance-ids i-007975d6b77628dc4
aws ec2 wait instance-terminated --instance-ids i-007975d6b77628dc4
aws ec2 delete-security-group --group-id sg-54af3929
aws ec2 disassociate-route-table --association-id rtbassoc-4add8132
aws ec2 delete-route-table --route-table-id rtb-b719a6ce
aws ec2 detach-internet-gateway --internet-gateway-id igw-c22a0fa5 --vpc-id vpc-d97937bf
aws ec2 delete-internet-gateway --internet-gateway-id igw-c22a0fa5
aws ec2 delete-subnet --subnet-id subnet-559bc00e
aws ec2 delete-vpc --vpc-id vpc-d97937bf
echo If you want to delete the key-pair, please do it manually.
