#!/bin/bash -xe

env=$1
version=$2
old_pwd=`pwd`

echo “Testing lambda”
/var/lib/jenkins/.local/bin/python-lambda-local -f handler -t 5 $old_pwd/hello_lambda.py $old_pwd/scripts/event.json
/var/lib/jenkins/.local/bin/python-lambda-local -f post_handler -t 5 $old_pwd/hello_lambda.py $old_pwd/scripts/event.json
