#!/bin/bash -xe

version=$1
old_pwd=`pwd`

$old_pwd/scripts/hello_lambda_test.sh
echo “Building lambda”
zip hello_lambda.zip hello_lambda.py 
aws s3 cp hello_lambda.zip s3://assignment-serverless-hello/v${version}/hello_lambda.zip
