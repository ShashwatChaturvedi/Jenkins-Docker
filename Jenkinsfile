pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Ensure Docker is available
                    sh 'docker --version'
                    
                    // Build Docker image
                    sh 'docker build -t my-simple-static-site .'
                    
                    // Stop and remove any existing container
                    sh 'docker stop my-simple-static-site-container || true'
                    sh 'docker rm my-simple-static-site-container || true'
                    
                    // Run new Docker container
                    sh 'docker run -d --name my-simple-static-site-container -p 80:80 my-simple-static-site'
                }
            }
        }
    }
}
