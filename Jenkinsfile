pipeline {
    agent any
    
    stages {
        stage("testing app") {
            steps {
                script {
                    echo "testing application ${env.BRANCH_NAME}"
                }
            }
        }
        stage("building app") {
            when {
                expression {
                    env.BRANCH_NAME == 'dev' || env.BRANCH_NAME == 'staging'
                }
            }
            steps {
                script {
                    echo "building application in ${env.BRANCH_NAME}"
                    
                }
            }
        }
        
        stage("deploy staging") {
            when {
                anyOf {
                    branch 'staging'
                }
            }
            steps {
                script {
                    echo 'deploying application to Staging'
                }
            }
        }
        stage("deploy dev") {
            when {
                anyOf {
                    branch 'dev'
                }
            }
            steps {
                script {
                    input message: "Approve deployment for dev"
                }
                echo 'deploying application'
            }
        }
    }
}