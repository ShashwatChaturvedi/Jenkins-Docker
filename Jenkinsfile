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
                sh 'docker build -t my-simple-static-site .'
                sh 'docker stop my-simple-static-site-container || true'
                sh 'docker rm my-simple-static-site-container || true'
                sh 'docker run -d --name my-simple-static-site-container -p 80:80 my-simple-static-site'
            }
        }
    }
}
