#!/bin/bash -xe

env=$1
version=$2
old_pwd=`pwd`

$old_pwd/scripts/hello_lambda_test.sh
$old_pwd/scripts/hello_lambda_deploy.sh ${env} ${version}
