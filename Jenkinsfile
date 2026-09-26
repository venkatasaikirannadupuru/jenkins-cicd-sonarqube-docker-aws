pipeline {

    agent any

    environment {
        DOCKER_IMAGE = "sai-kiran-portfolio"
        DOCKER_CONTAINER = "sai-kiran-portfolio"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                echo 'Building and testing portfolio application...'
                sh 'test -f app/index.html'
                sh 'test -f Dockerfile'
                echo 'Build validation successful.'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo 'Running SonarQube analysis...'
                // SonarQube configuration will be added after
                // the SonarQube server is installed and configured.
            }
        }

        stage('Quality Gate') {
            steps {
                echo 'Waiting for SonarQube Quality Gate...'
                // Quality Gate configuration will be added later.
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:latest .'
            }
        }

        stage('Docker Test') {
            steps {
                sh 'docker run -d --name ${DOCKER_CONTAINER}-test -p 8081:80 ${DOCKER_IMAGE}:latest'
                sh 'sleep 5'
                sh 'curl -f http://localhost:8081'
            }
        }

        stage('Docker Cleanup') {
            steps {
                sh 'docker rm -f ${DOCKER_CONTAINER}-test || true'
            }
        }

    }

    post {
        success {
            echo 'CI pipeline completed successfully.'
        }

        failure {
            echo 'CI pipeline failed. Check the Jenkins console output.'
        }
    }
}