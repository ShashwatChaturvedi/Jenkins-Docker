pipeline {
    agent any
    
    environment {
        DOCKER_HUB_REPO = 'shashwatchaturvedi26072002/jenkins-docker'  // Your DockerHub repo
        DOCKER_HUB_CREDENTIALS_ID = 'dockerhub-credentials'  // Use Jenkins credentials ID
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/ShashwatChaturvedi/Jenkins-Docker'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.DOCKER_HUB_REPO}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${env.DOCKER_HUB_CREDENTIALS_ID}") {
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    dockerImage.run("-d -p 8081:80")
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed!'
        }
    }
}
