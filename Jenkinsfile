pipeline {
    agent { label 'sample-agent' }

    environment {
        // Inject AWS credentials from Jenkins
        AWS_ACCESS_KEY_ID     = credentials('aws-KrishnaIAM-keys')
        AWS_SECRET_ACCESS_KEY = credentials('aws-KrishnaIAM-keys')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/krishnamonani/task-14-tf-jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
