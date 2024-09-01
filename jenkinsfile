pipeline {
    agent any

    environment {
                DOCKERHUB_CREDENTIALS = credentials('topjay-dockerhub')
                }
    
    stages {
        stage('Build') {
            steps {
                sh 'echo "Build steps go here..."'
                // Build the Docker image
                sh 'docker build -t topjay/node-app:latest .'
                
                }
        }
        stage('Login') {
            steps {
                powershell '''              
                echo $DOCKERHUB_CREDENTIALS | docker login -u $DOCKERHUB_CREDENTIALS --password-stdin
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