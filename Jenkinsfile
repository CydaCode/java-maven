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
            input {
                message 'Select the ennnnnnvironment   to deploy to'
                ok 'Done'
                parameters {
                    choice(name: 'ENV', choices: ['dev', 'staging', 'prod'], description: '')
                }
            }
            steps {
                script {
                    gv.deployApp()
                    echo "deploying to ${ENV}"
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

