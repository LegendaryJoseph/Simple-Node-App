pipeline {
    agent any
    
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
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                powershell '''
                docker login -u "$env:DOCKERHUB_USERNAME" -p "$env:DOCKERHUB_PASSWORD"
                '''
                }
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