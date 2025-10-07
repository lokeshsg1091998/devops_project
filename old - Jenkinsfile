pipeline {
    agent {label 'node_1'}

    stages {
        // stage('1.git') {
        //     steps {
        //         git credentialsId: 'github_credentials', url: 'https://github.com/aabhinnav1999/DevOpsSec_project'
        //     }
        // }
        // stage('2.scripts.sh') {
        //     steps {
        //         sh '''sudo chmod +x scripts.sh
        //         ./scripts.sh'''
        //     }
        // }
        // stage('3.gunicorn') {
        //     steps {
        //         sh '''cd gunicorn_folder
        //         sudo chmod +x gunicorn.sh
        //         ./gunicorn.sh'''
        //     }
        // }
        // stage('3.nginx') {
        //     steps {
        //         sh '''cd nginx
        //         sudo chmod +x nginx.sh
        //         ./nginx.sh'''
        //     }
        // }
        stage('1.git') {
            steps {
                git credentialsId: 'github_credentials', url: 'https://github.com/aabhinnav1999/DevOpsSec_project'
            }
        }
        stage('2. copy') {
            steps {
            sh '''sudo cp -r /home/ubuntu/cicd/workspace/django_pipeline/* /home/ubuntu/DevOpsSec_project/'''
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