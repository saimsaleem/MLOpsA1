pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = '966f195f-0748-4c7b-971e-5597de11a2be'
        DOCKER_IMAGE_NAME = 'saimsaleem/heartmodel'
        DOCKERFILE_PATH = 'Dockerfile' 
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("saimsaleem/heartmodel", "-f ${env.DOCKERFILE_PATH} .")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', env.DOCKER_HUB_CREDENTIALS) {
                        docker.image(env.DOCKER_IMAGE_NAME).push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image build and push successful!'
        }
        failure {
            echo 'Docker image build or push failed!'
        }
    }
}