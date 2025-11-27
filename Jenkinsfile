pipeline {
    agent any
    stages {
        stage(build stage) {
            steps {
                echo 'Building the packages...'
            }
            
        }
        stage(test stage) {
            steps {
                echo 'Testing the product...'
            }
            
        }
        stage(deploy stage) {
            steps {
                echo 'Deploying the product...'
            }
            
        }
    }
}

