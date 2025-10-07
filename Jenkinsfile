def color_map =[
'FAILURE':'danger',
'SUCCESS':'good',
'UNSTABLE':'warning',
'ABORTED':'#5303ff'  
]

pipeline {
    agent {label 'node_1'}
    stages {
        stage("1.git") {
            steps {
               git credentialsId: 'github_credentials', url: 'https://github.com/aabhinnav1999/DevOpsSec_project'
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
    post 
    {
        always
        {
           slackSend channel: 'aabhinnav_jenkins', color: color_map[currentBuild.currentResult], message: "pipeline status : ${currentBuild.currentResult} \n job name: ${env.JOB_NAME} \n build number: ${env.BUILD_NUMBER} \n ${env.BUILD_URL}"
        }
    }

}