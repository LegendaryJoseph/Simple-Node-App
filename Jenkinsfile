pipeline {
    agent any

    environment {
                DOCKERHUB_CREDENTIALS = credentials('topjay-dockerhub')
                }
    
    stages {
        stage('Build') {
            steps {
                bat 'echo "Build steps go here..."'
                // Build the Docker image
                bat 'docker build -t topjay/node-app:latest .'
                
                }
        }
        stage('Login') {
            steps {
                powershell '''              
                withCredentials([usernamePassword(credentialsId: 'topjay-dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    powershell '''
                        $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin
                '''
                }
        }
        stage('Push') {
            steps {
                powershell '''              
                docker push topjay/node-app:latest
                '''
                }
        }
            
        }
    }