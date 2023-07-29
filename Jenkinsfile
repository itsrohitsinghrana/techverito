pipeline {
    agent any

    environment {
        // DockerHub credentials set up in Jenkins
        DOCKERHUB_CREDS = 'dockerHubCredentials'
        BACKEND_IMAGE_NAME = 'itsrohitsinghrana/tech-bak-image:latest'
        FRONTEND_IMAGE_NAME = 'itsrohitsinghrana/tech-front-image:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/itsrohitsinghrana/techverito.git'
            }
        }

        stage('Build Backend Docker Image') {
            steps {
                dir('backend') {
                    script {
                        def backendImage = docker.build(BACKEND_IMAGE_NAME)
                        docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDS) {
                            backendImage.push('latest')
                        }
                    }
                }
            }
        }

        stage('Build Frontend Docker Image') {
            steps {
                dir('frontend') {
                    script {
                        def frontendImage = docker.build(FRONTEND_IMAGE_NAME)
                        docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDS) {
                            frontendImage.push('latest')
                        }
                    }
                }
            }
        }

        stage('Deploy to Remote Server') {
            steps {
                script {
                    // Assumes you have a credentials ID set up in Jenkins for your remote server
                    withCredentials([sshUserPrivateKey(credentialsId: 'remoteServerCredentials', keyFileVariable: 'SSH_KEY')]) {
                        sh """
                            scp -i $SSH_KEY docker-compose.yml ubuntu@ip:/home/ubuntu
                            ssh -i $SSH_KEY ubuntu@ip 'cd /home/ubuntu && docker-compose pull && docker-compose up -d'
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
