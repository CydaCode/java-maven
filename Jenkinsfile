pipeline {
    agent any
    tools {
        maven 'maven_3.9.11'
    }
    stages {
        stage("build jar") {
            steps {
                script {
                    echo 'building application'
                    sh 'mvn package'
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