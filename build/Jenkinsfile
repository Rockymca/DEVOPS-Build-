pipeline {
    agent any
    environment {
        IMAGE_NAME = 'rockymca/react-app:latest'
    }
    stages {
        stage('Build and Push') {
            when {
                branch 'main'
            }
            steps {
                script {
                    echo "🔧 Branch is main, proceeding with build and push..."
                    sh 'docker build -t react-app:latest .'
                    sh 'docker tag react-app:latest $IMAGE_NAME'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        sh 'docker push $IMAGE_NAME'
                    }
                }
            }
        }
        stage('Skip Build') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                echo "🛑 Not on main branch — skipping build and push."
            }
        }
    }
}
