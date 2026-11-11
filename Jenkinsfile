pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                // Dockerfile se image build karne ke liye
                sh "docker build -t itiss37/cdac:latest ."
            }
        }

        stage('Run Docker') {
            steps {
                echo 'Running Java application inside Docker...'
                // Container ko run karenge aur uske logs (output) ko screen par print karenge
                sh "docker run --rm itiss37/cdac:latest"
            }
        }

        stage('Push image to docker hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin 
                    docker push itiss37/cdac:latest 
                    docker logout
                    '''
                }
            }
        }
    }
}


