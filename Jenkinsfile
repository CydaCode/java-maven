#!/usr/bin/env groovy

@Library("jenkins-shared-lib")
def gv
pipeline {
    agent any
    tools {
        maven 'maven_3.9.11'
    }
    stages {
        stage("Initializing") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar") {
            steps {
                script {
                    echo 'Also testing the webhook again and again'
                    buildJar()
                }
            }
        }
        stage("build image and login") {
            steps {
                script {
                    buildImage 'cloudqween/private_repo:jma.2.0'
                    dockerLogin()
                    dockerPush 'cloudqween/private_repo:jma.2.0'
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo 'Triggering the Webhook ones again'
                    gv.deployApp()  
                }
            }
        }
    }
}