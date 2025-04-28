pipeline {
    agent any

    environment {

        IMAGES = 'helloworld-web'
        DEPLOYMENT_NAME = 'helloworld-web'
        NAMESPACE = 'hometask'

        GIT_URL = 'https://github.com/test55/hometask_55.git'
        GIT_BRANCH = 'main'

        BUILD_VERSION = '2.0.0' // increment the version
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    git url: "${GIT_URL}", branch: "${GIT_BRANCH}"
            }
        }

        stage('Build image') {
            steps {
                script {
                    sh 'docker build -t ${IMAGES}:${BUILD_VERSION} .'
                }
            }
        }

        stage('Load Docker image into Local Kind Cluster') {
            steps {
                script {
                    sh 'kind load docker-image ${IMAGES}:${BUILD_VERSION} --name local-k8s'
                }
            }
        }

        stage('Deploy to k8s') {
            steps {
                script {

                    sh 'kubectl set image deployment/${DEPLOYMENT_NAME} nginx=${IMAGES}:${BUILD_VERSION} -n ${NAMESPACE}'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {

                    sh 'kubectl get pods --namespace=${NAMESPACE}'
                }
            }
        }
    }
}