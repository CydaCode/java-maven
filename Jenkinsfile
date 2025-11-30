pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage("build jar") {
            steps {
                script {
                    echo 'building application'
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    echo 'building application'
                    withCredentials([
                        usernamePassword(credentialsId: 'docker-hub-id', usernameVariable: 'USER', passwordVariable: 'PASSWORD')
                    ]) {
                        sh '''
                            docker build -t cloudqween/private_repo:jma.2.0 .
                            echo $PASSWORD | docker login -u $USER --password-stdin
                            docker push cloudqween/private_repo:jma.2.0
                        '''
                    }
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo 'deploying application'
                }
            }
        }
    }
}