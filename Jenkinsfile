pipeline {
    agent any
      stages {
        stage('Build and puch image to Dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_credentials', passwordVariable: 'pswd', usernameVariable: 'user')])  {
                sh 'cd code && sudo docker build -t direction-app:latest .'
                sh 'sudo docker tag direction-app:latest olaniyikolawole744/direction-dev:latest'
                sh 'sudo docker login -u olaniyikolawole744 -p $pswd'
                sh 'sudo docker push olaniyikolawole744/direction-dev:latest'
                }
            }
          }
        

        stage('Manage Main Branch') {
            when {
              branch "main"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'remote_credentials', keyFileVariable: '')])  {
                sh 'ssh ec2-user@18.236.214.39 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-prod:latest'
            }
         }
    }

        stage('Manage Develop Branch') {
            when {
                branch "develop"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'remote_credentials', keyFileVariable: '')])  {
                sh 'ssh ec2-user@34.218.58.14 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-dev:latest'
                   }
                }
            }
        }
   }
    

