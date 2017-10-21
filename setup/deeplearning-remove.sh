#!/bin/bash
aws ec2 disassociate-address --association-id eipassoc-d64ae9e9
aws ec2 release-address --allocation-id eipalloc-426ef87f
aws ec2 terminate-instances --instance-ids i-0fd2705915d072084
aws ec2 wait instance-terminated --instance-ids i-0fd2705915d072084
aws ec2 delete-security-group --group-id sg-39cba244
aws ec2 disassociate-route-table --association-id rtbassoc-f27a528a
aws ec2 delete-route-table --route-table-id rtb-564cc32f
aws ec2 detach-internet-gateway --internet-gateway-id igw-fdf9d79a --vpc-id vpc-74441912
aws ec2 delete-internet-gateway --internet-gateway-id igw-fdf9d79a
aws ec2 delete-subnet --subnet-id subnet-aa9effcc
aws ec2 delete-vpc --vpc-id vpc-74441912
echo If you want to delete the key-pair, please do it manually.
