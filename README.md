# Hello_world_Assignement

Youtube Video: https://youtu.be/XOmeEU1L4Cc

- sudo apt install python
- curl -O https://bootstrap.pypa.io/get-pip.py
- python get-pip.py --user
- export PATH=~/.local/bin:$PATH
- pip install awscli --upgrade --user
- wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
- sudo apt install unzip
- sudo apt install zip
- unzip terraform_0.11.8_linux_amd64.zip
- mv terraform /usr/bin
- cd ~/Hello_world_Assignement

- Change aws Credentiel into terraform.tfvars  [aws user must have permission to S3 - Api gw - Lambda - iam create role]
- aws configure
- aws s3api create-bucket --bucket=assignment-serverless --region=us-east-1
- aws s3 cp hello_lambda.zip s3://assignment-serverless/v1.0.0/hello_lambda.zip


- terraform init
- terraform plan -var="env=dev" -var="app_version=1.0.0" 
- terraform apply -var="env=dev" -var="app_version=1.0.0" 
- terraform apply -var="env=dev" -var="app_version=1.0.1" 
- terraform destroy
