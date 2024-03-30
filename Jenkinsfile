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
