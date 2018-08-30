#!/bin/groovy
def userInput
def env

pipeline {
    agent any
    
    parameters {
        choice(choices: 'build\ndev\ntest\ndemo\nproduction', description: '', name: 'env')
        string(name: 'version', defaultValue: '1.0.0', description: 'App version To Depoy')
    }
    
    stages {
        stage('Checkout Git') {
            steps {
                echo 'Checkout git Repo..'
                checkout scm
                script {
                    env = params.env
                }
            }
        }    
        stage('Build') {
            when { expression { params.env == 'build' } }
            steps {
                echo 'Building..'
                sh """#!/bin/bash -xe
                export PATH=~/.local/bin:$PATH
                cp /home/terraform.tfvars ~/workspace/Hello_world_Assignement/terraform.tfvars
                ./scripts/hello_lambda_build.sh ${params.version}
                """
            }
        }
        stage('Dev Approval') {
            when { expression { params.env == 'build' } }
            steps {
                script {
                   userInput = input(id: 'userInput', message: 'Merge to Dev?',
                   parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
                       description:'describing choices', name:'TestChoice', choices: "dev\ntest\ndemo\nproduction\nfinish"]
                    ])
                    env = userInput
                 }
            }
        }
        stage('Dev') {
            when { expression { params.env == 'dev' || userInput == 'dev' } }
            steps { 
                echo 'Dev..'
                sh """#!/bin/bash -xe
                export PATH=~/.local/bin:$PATH
                cp /home/terraform.tfvars ~/workspace/Hello_world_Assignement/terraform.tfvars
                echo 'yes' | ./scripts/Deploy_S3_Lambda_Apigw.sh ${env} ${params.version}
                """
            }
        }
        stage('Test Approval') {
            when { expression { params.env == 'dev' || userInput == 'dev' } }
            steps {
                script {
                   userInput = input(id: 'userInput', message: 'Merge to Test?',
                   parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
                       description:'describing choices', name:'TestChoice', choices: "test\ndemo\nproduction\nfinish"]
                    ])
                    env = userInput
                 }
            }
        }
        stage('Test') {
            when { expression { params.env == 'test' || userInput == 'test' } }
            steps {  
                echo 'Test....'
                sh """#!/bin/bash -xe
                export PATH=~/.local/bin:$PATH
                cp /home/terraform.tfvars ~/workspace/Hello_world_Assignement/terraform.tfvars
                echo 'yes' | ./scripts/Deploy_S3_Lambda_Apigw.sh ${env} ${params.version}
                """
             }
        }
        stage('Demo Approval') {
            when { expression { params.env == 'test' || userInput == 'test' } }
            steps {
                script {
                   userInput = input(id: 'userInput', message: 'Merge to Demo ?',
                   parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
                       description:'describing choices', name:'DemoChoice', choices: "demo\nproduction\nfinish"]
                    ])
                    env = userInput
                 }
            }
        }
        stage('Demo') {
            when { expression { params.env == 'demo' || userInput == 'demo' } }
            steps { 
                echo 'Demo....'
                sh """#!/bin/bash -xe
                export PATH=~/.local/bin:$PATH
                cp /home/terraform.tfvars ~/workspace/Hello_world_Assignement/terraform.tfvars
                echo 'yes' | ./scripts/Deploy_S3_Lambda_Apigw.sh ${env} ${params.version}
                """
            }
        }
        stage('Approval') {
            when { expression { params.env == 'demo' || userInput == 'demo' } }
            steps {
                script {
                   userInput = input(id: 'userInput', message: 'Merge to Production ?',
                   parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
                       description:'describing choices', name:'Choice', choices: "production\nfinish"]
                    ])
                    env = userInput
                 }
            }
        }
        stage('Production') {
             when { expression { params.env == 'production' || userInput == 'production' } }
             steps {  
                 echo 'Deploying....'
                 sh """#!/bin/bash -xe
                export PATH=~/.local/bin:$PATH
                cp /home/terraform.tfvars ~/workspace/Hello_world_Assignement/terraform.tfvars
                echo 'yes' | ./scripts/Deploy_S3_Lambda_Apigw.sh ${env} ${params.version}
                """
             }
         }        
    }
}
