#!/bin/bash -xe

env=$1
version=$2

echo “Deployment lambda”
terraform init
terraform plan -var="env=${env}" -var="app_version=${version}"
terraform apply -var="env=${env}" -var="app_version=${version}"
