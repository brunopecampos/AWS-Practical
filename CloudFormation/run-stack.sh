aws cloudformation create-stack --stack-name vpc --template-body file://CloudFormation/network.yaml
aws cloudformation create-stack --stack-name s3 --template-body file://CloudFormation/s3.yaml
