#!/bin/bash

#aws cloudformation create-stack --stack-name vpc --template-body file://network.yaml
#aws cloudformation wait stack-create-complete --stack-name vpc
#aws cloudformation create-stack --stack-name s3 --template-body file://s3.yaml
aws cloudformation create-stack --stack-name rds --template-body file://rds.yaml
aws cloudformation wait stack-create-complete --stack-name rds
aws cloudformation create-stack --stack-name bastion --template-body file://bastion.yaml
aws cloudformation create-stack --stack-name asg --template-body file://asg.yaml


