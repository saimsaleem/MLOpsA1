pipeline {
    agent any
    
    stages {
        stage('Build and Test') {
            steps {
                script {
                    // Run your build and test commands here
                    sh 'python -m unittest test.py'
                }
            }
        }
        
        stage('Containerize') {
            steps {
                script {
                    // Build and tag the Docker image
                    docker.build('saimsaleem/heart_model:latest')
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-id') {
                        docker.image('your-docker-username/your-image-name:latest').push('latest')
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
