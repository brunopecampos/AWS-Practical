#!/bin/sh
aws cloudformation delete-stack --stack-name full-stack
aws rds wait db-instance-deleted --db-instance-identifier opus-database
aws cloudformation delete-stack --stack-name full-stack
aws s3 rm s3://opus-bruno-campos-stacks --recursive
aws cloudformation delete-stack --stack-name stack-bucket