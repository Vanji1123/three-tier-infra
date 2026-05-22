pipeline {

    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
spec:
  serviceAccountName: jenkins-irsa

  containers:
  - name: terraform
    image: 806997205166.dkr.ecr.ap-south-1.amazonaws.com/custom-jenkins:latest
    command:
    - cat
    tty: true
"""
            defaultContainer 'terraform'
        }
    }

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
                    sh 'terraform plan -var-file=dev.tfvars'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('main-infra') {
                    sh 'terraform apply -auto-approve -var-file=dev.tfvars'
                }
            }
        }

    }

}