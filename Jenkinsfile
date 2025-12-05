#!/usr/bin/env groovy

Library identifier: 'jenkins-shared-lib@main', retriever: modernSCM([
    $class: 'GitSCMSource',
    remote: 'https://github.com/CydaCode/jenkins-shared-lib.git',
    credentialId: 'github-id'
])


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
                    gv.deployApp()  
                }
            }
        }
    }
}