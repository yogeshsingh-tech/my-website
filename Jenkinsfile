pipeline {
    agent any

    environment {
        IMAGE_NAME     = 'my-website'
        CONTAINER_NAME = 'my-website'
        HOST_PORT      = '8081'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER -t $IMAGE_NAME:latest .'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p $HOST_PORT:80 $IMAGE_NAME:latest
                '''
            }
        }
        stage('Verify') {
            steps {
                sh '''
                    sleep 3
                    curl -f http://localhost:$HOST_PORT > /dev/null
                '''
            }
        }
    }

    post {
        success { echo 'Deployment successful!' }
        failure { echo 'Deployment failed.' }
    }
}
EOFcat > Jenkinsfile << 'EOF'
pipeline {
    agent any

    environment {
        IMAGE_NAME     = 'my-website'
        CONTAINER_NAME = 'my-website'
        HOST_PORT      = '8081'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER -t $IMAGE_NAME:latest .'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p $HOST_PORT:80 $IMAGE_NAME:latest
                '''
            }
        }
        stage('Verify') {
            steps {
                sh '''
                    sleep 3
                    curl -f http://localhost:$HOST_PORT > /dev/null
                '''
            }
        }
    }

    post {
        success { echo 'Deployment successful!' }
        failure { echo 'Deployment failed.' }
    }
}
