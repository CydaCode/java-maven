def gv
pipeline {
    agent any
    stages {
        stage("Initializing groovy") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
            
        }
        stage("build stage") {
            steps {
                script {
                    gv.buildApp()
                }
            }
            
        }
        stage("test stage") {
            steps {
                script {
                    gv.testApp()
                }
            }
            
        }
        stage("deploy stage") {
            steps {
                script {
                    gv.deployApp()
                }
            }
            
        }
    }
    post {
        success {
            echo 'App built successfully'
        }
        failure {
            echo 'There is something wrong'
        }
    }
}

