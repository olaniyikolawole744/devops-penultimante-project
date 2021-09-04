pipeline {
    agent any
      stages {
        stage('Login to Dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'mypass', usernameVariable: 'myuser')]) {
                sh 'cd code && sudo docker build -t direction-app:latest .'
                sh 'sudo docker tag direction-app:latest olaniyikolawole744/direction-prod:latest'
                sh 'sudo docker login -u olaniyikolawole744 -p $mypass'
                sh 'sudo docker push olaniyikolawole744/direction-prod:latest'
            }
          }
        }

        stage('Manage Master Branch') {
            when {
              branch "main"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'jenkins-node-key', keyFileVariable: '')]) {
                sh 'ssh ec2-user@3.90.225.74 sudo docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-prod:latest'
             }
         }
    }

        stage('Manage Develop Branch.') {
            when {
                branch "develop"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'jenkins-node-key', keyFileVariable: '')]) {
                sh 'ssh ec2-user@52.91.205.82 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-dev:latest'
                    }
                }
            }
        }
    }

