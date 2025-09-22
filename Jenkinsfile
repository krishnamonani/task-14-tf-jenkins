pipeline {
    agent { label 'sample-agent' }
    environment {
        // AWS credentials ID from Jenkins Credentials
        AWS_CREDS = credentials('aws-KrishnaIAM-keys')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/krishnamonani/task-14-tf-jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withEnv([
                    "AWS_ACCESS_KEY_ID=${AWS_CREDS_USR}", 
                    "AWS_SECRET_ACCESS_KEY=${AWS_CREDS_PSW}"
                ]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withEnv([
                    "AWS_ACCESS_KEY_ID=${AWS_CREDS_USR}", 
                    "AWS_SECRET_ACCESS_KEY=${AWS_CREDS_PSW}"
                ]) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withEnv([
                    "AWS_ACCESS_KEY_ID=${AWS_CREDS_USR}", 
                    "AWS_SECRET_ACCESS_KEY=${AWS_CREDS_PSW}"
                ]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
