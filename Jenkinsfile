pipeline {
    agent {label 'node_1'}
    stages {
        stage("1.git") {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/lokeshsg1091998/devops_project']])
            }
        }
        stage("2.build") {
            steps {
                sh '''#!/bin/bash
                    source env/bin/activate
                    pip install -r requirements.txt'''
            }
        }
        
        stage('3.restart') {
            steps {
                sh '''sudo systemctl daemon-reload
                    sudo systemctl restart gunicorn
                    sudo systemctl restart nginx'''
            }
        } 

    }
}