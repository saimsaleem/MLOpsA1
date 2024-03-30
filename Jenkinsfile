pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.build('your-image-name:latest')
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image('your-image-name:latest').push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            mail to: 'admin@example.com',
                 subject: 'Jenkins Job Successful',
                 body: 'The Jenkins job to containerize and push the application to Docker Hub was successful.'
        }
    }
}