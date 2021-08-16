pipeline {
    agent any
        stages {
        stage('Login to Dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-key', passwordVariable: 'mypass', usernameVariable: 'myname')]) {
                sh 'cd code && sudo docker build -t direction-prod:latest .'
                sh 'sudo docker tag direction-prod:latest olaniyikolawole744/direction-prod:latest'
                sh 'sudo docker tag direction-dev:latest olaniyikolawole744/direction-dev:latest'
                sh 'sudo docker login -u olaniyikolawole744 -p $mypass'
                sh 'sudo docker push olaniyikolawole744/direction-prod:latest'
                sh 'sudo docker push olaniyikolawole744/direction-dev:latest'
            }
          }
        }

        stage('Manage Master Branch') {
            when {
              branch "main"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'node-server-key', keyFileVariable: '')]) {
                sh 'ssh ec2-user@54.90.171.174 sudo docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-prod:latest'
             }
         }
    }

        stage('Manage Develop Branch.') {
            when {
                branch "develop"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'jenkins-server-key', keyFileVariable: '')]) {
                sh 'ssh ec2-user@54.174.15.235 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-dev:latest'
                    }
                }
            }
        }
    }

