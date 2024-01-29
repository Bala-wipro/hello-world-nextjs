pipeline {
    agent any

    environment {
        registry = '126124269786.dkr.ecr.us-east-1.amazonaws.com/hello-world-app'
        imageName = 'hello-world-app'
        gitCredentials = 'github_madhukar'
        awsCredentials = 'madhukar_aws'
    }


    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build and Test') {
            steps {
                script {
                    // Add your Node.js build and test commands here
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.gitCredentials, usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        sh "docker build -t $registry/$imageName:$GIT_COMMIT ."
                    }
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    withCredentials([aws(credentialsId: env.awsCredentials, region: 'your-ecr-region')]) {
                        sh "aws ecr get-login-password --region your-ecr-region | docker login --username AWS --password-stdin $registry"
                        sh "docker push $registry/$imageName:$GIT_COMMIT"
                    }
                }
            }
        }
    }
}
