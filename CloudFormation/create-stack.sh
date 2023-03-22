#!/bin/bash
aws cloudformation create-stack --stack-name stack-bucket --template-body file://stack-bucket.yaml 1>/dev/null
aws cloudformation wait stack-create-complete --stack-name stack-bucket
echo "Successfully created stack bucket."
aws s3 sync stack-bucket/ s3://opus-bruno-campos-stacks
aws s3 cp ../EC2/cloudwatch-agent.json s3://opus-bruno-campos-stacks
echo "Synchronized stack."
aws s3api wait object-exists --bucket opus-bruno-campos-stacks --key vpc.yaml
aws cloudformation create-stack --capabilities CAPABILITY_NAMED_IAM --stack-name full-stack --template-body file://full-stack.yaml 1>/dev/null
aws cloudformation wait stack-create-complete --stack-name full-stack
echo "Successfully created main stack."
cd ../S3/frontend
REACT_APP_ENDPOINT=$(aws elbv2 describe-load-balancers --names opus-alb --query "LoadBalancers[0].DNSName" --output text) yarn build
yarn deploy
echo "Deployed frontend to S3 bucket"