#!/usr/bin/env groovy
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
                    gv.buildApp()
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    gv.buildImage()
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