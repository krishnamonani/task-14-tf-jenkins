pipeline {
    agent { label 'sample-agent' }
    environment {
        AWS_CREDENTIALS = credentials('aws-KrishnaIAM-keys')
    }
    stages {
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/krishnamonani/task-14-tf-jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withEnv([
                    "AWS_ACCESS_KEY_ID=${AWS_CREDENTIALS_USR}",
                    "AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIALS_PSW}"
                ]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withEnv([
                    "AWS_ACCESS_KEY_ID=${AWS_CREDENTIALS_USR}",
                    "AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIALS_PSW}"
                ]) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withEnv([
                    "AWS_ACCESS_KEY_ID=${AWS_CREDENTIALS_USR}",
                    "AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIALS_PSW}"
                ]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }   
    }
}
