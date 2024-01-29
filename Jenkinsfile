pipeline {
    agent any

    environment {
        registry = '126124269786.dkr.ecr.us-east-1.amazonaws.com/hello-world-app'
        imageName = 'hello-world-app'
        gitCredentials = 'githubintegration'
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

        stage('Build docker Image and Push to ECR') {
            steps {
                script {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'madhukar_aws',
                        accessKeyVariable: 'AWS_ACCESS_KEY',
                        secrectKeyvariable: 'AWS_SECRECT_KEY']]) {
                        sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 126124269786.dkr.ecr.us-east-1.amazonaws.com"
                        sh "docker build -t hello-world-app ."
                        sh "docker tag hello-world-app:latest 126124269786.dkr.ecr.us-east-1.amazonaws.com/hello-world-app:latest"
                        sh "docker push 126124269786.dkr.ecr.us-east-1.amazonaws.com/hello-world-app:latest"
                    }
                }
            }
        }
    }
}
