pipeline {
    agent any

    environment {
        IMAGE_NAME = 'devops-react-app'
        CONTAINER_PORT = '80'
        HOST_PORT = '80'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'dev', url: 'https://github.com/Rockymca/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p $HOST_PORT:$CONTAINER_PORT $IMAGE_NAME'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
        success {
            echo 'Pipeline executed successfully.'
        }
    }
}
