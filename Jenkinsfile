pipeline {
    agent any
      stages {
        stage('Build and puch image to Dockerhub') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'id2', usernameVariable: 'user2')])  {
                sh 'cd code && sudo docker build -t direction-app:latest .'
                sh 'sudo docker tag direction-app:latest olaniyikolawole744/direction-prod:latest'
                sh 'sudo docker login -u olaniyikolawole744 -p $id2'
                sh 'sudo docker push olaniyikolawole744/direction-prod:latest'
                }
            }
          }
        

        stage('Manage Main Branch') {
            when {
              branch "main"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'remotenode-credentials', keyFileVariable: '')])  {
                sh 'ssh ec2-user@34.212.227.71 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-prod:latest'
            }
         }
    }

        stage('Manage Develop Branch') {
            when {
                branch "develop"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'remotenode-credentials', keyFileVariable: '')])  {
                sh 'ssh ec2-user@54.149.175.33 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-dev:latest'
                   }
                }
            }
        }
   }
    

