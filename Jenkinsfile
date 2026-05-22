pipeline {

    agent any

    environment {
        AWS_REGION = 'ap-south-1'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir('main-infra') {
                    sh 'terraform init -backend-config=backend.hcl'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('main-infra') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('main-infra') {
                    sh 'terraform plan'
                }
            }
        }

    }

}
