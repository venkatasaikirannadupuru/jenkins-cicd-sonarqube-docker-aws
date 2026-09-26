pipeline {

    agent any

    environment {
        DOCKER_IMAGE = "sai-kiran-portfolio"
        DOCKER_CONTAINER = "sai-kiran-portfolio"
        SONAR_SCANNER_HOME = tool 'SonarQubeScanner'
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
                withSonarQubeEnv('SonarQube') {
                    sh '''
                        ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
                          -Dsonar.projectKey=sai-kiran-portfolio \
                          -Dsonar.projectName="Sai Kiran Portfolio" \
                          -Dsonar.sources=app
                    '''
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
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