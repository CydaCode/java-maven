
pipeline {
    agent any
    tools {
        maven 'maven_3.9.11'
    }
    stages {
        stage("Incrementing versioning") {
            steps {
                script {
                    echo 'Incrementing the image version.......'
                    sh "mvn build-helper:parse-version versions:set \
                    -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                    versions:commit"
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
                }
            }
            
        }
        stage("build Jar stage") {
            steps {
                script {
                    echo 'Building the Jar Image...'
                    sh 'mvn clean package'
                }
            }
            
        }
        stage("build Image stage") {
            steps {
                script {
                    echo 'building application'
                    withCredentials([
                        usernamePassword(credentialsId: 'docker-hub-id', usernameVariable: 'USER', passwordVariable: 'PASSWORD')
                    ]) {
                        sh '''
                            docker build -t cloudqween/private_repo:${IMAGE_NAME} .
                            echo $PASSWORD | docker login -u $USER --password-stdin
                            docker push cloudqween/private_repo:${IMAGE_NAME}
                            '''
                        }
                    }
            }
            
        }
        stage("deploy stage") {
            
            steps {
                script {
                    echo "deploying app"
                }
            }
            
        }
        stage("recommit versioning to git stage") {
            
            steps {
                script {
                    withCredentials([
                        usernamePassword(credentialsId: 'github-id', usernameVariable: 'USER', passwordVariable: 'PASSWORD')
                    ]) {
                        sh '''
                            git config --global user.email "jenkins@example.com"
                            git config --global user.name "jenkins"

                            git status
                            git branch
                            git config --list

                            git remote set-url origin https://${USER}:${PASSWORD}@github.com/CydaCode/java-maven.git
                            git add .
                            git commit -m "ci: version bump"
                            git push origin HEAD:jenkins-jobs
                        '''
                    }
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

