#!/bin/sh
aws s3 rm s3://opus-bruno-campos-frontend-website --recursive
aws cloudformation delete-stack --stack-name full-stack
aws rds wait db-instance-deleted --db-instance-identifier opus-database
aws cloudformation delete-stack --stack-name full-stack
echo "Deleted full stack."
aws s3 rm s3://opus-bruno-campos-stacks --recursive
echo "Frontend bucket empty."
aws cloudformation delete-stack --stack-name stack-bucket