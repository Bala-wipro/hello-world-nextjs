pipeline {
    agent any
    
    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID = 'AKIAR2XMXUDNI7IR5LIH'
        AWS_SECRET_ACCESS_KEY = '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'
    }


    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    
                    sh "aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}"
                    sh "aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}"
                    sh "aws configure set region ${AWS_REGION}"
                    sh "ls -la /var/lib/jenkins/workspace/nodejs/"
                    sh "docker build -t hello-world-app ."
                    sh "docker tag hello-world-app:latest 126124269786.dkr.ecr.us-east-1.amazonaws.com/hello-world-app:latest"
                    sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 126124269786.dkr.ecr.us-east-1.amazonaws.com"
                    sh "docker push 126124269786.dkr.ecr.us-east-1.amazonaws.com/hello-world-app:latest"
                    }
                    }
                }
            }
    }
