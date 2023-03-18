#!/bin/bash
aws cloudformation create-stack --stack-name stack-bucket --template-body file://stack-bucket.yaml 1>/dev/null
aws cloudformation wait stack-create-complete --stack-name stack-bucket
echo "Sucessefully created stack."
aws s3 sync stack-bucket/ s3://opus-bruno-campos-stacks
echo "Synchronized stack."
aws s3api wait object-exists --bucket opus-bruno-campos-stacks --key vpc.yaml
aws cloudformation create-stack --stack-name full-stack --template-body file://full-stack.yaml 1>/dev/null
aws cloudformation wait stack-create-complete --stack-name full-stack
#echo $(aws elbv2 describe-load-balancers --names opus-alb --query "LoadBalancers[0].DNSName" --output text) > ../S3/frontend/lb_endpoint

