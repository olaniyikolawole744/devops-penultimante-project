pipeline {
    agent any
      stages {
        stage('Build and push image to Dockerhub') {
            steps {
               withCredentials([usernamePassword(credentialsId: '4f923a21-7b2e-4b4c-8bba-eb3d16b57b1d', passwordVariable: 'mypw', usernameVariable: 'myusr')]) {
                sh 'cd code && sudo docker build -t direction-dev:latest .'
                sh 'sudo docker tag direction-dev:latest olaniyikolawole744/direction-dev:latest'
                sh 'sudo docker login -u olaniyikolawole744 -p $mypw'
                sh 'sudo docker push olaniyikolawole744/direction-dev:latest'
                }
            }
          }
        

        stage('Manage Main Branch') {
            when {
              branch "main"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'jenkins_credentials', keyFileVariable: '')]) {
                sh 'ssh ec2-user@50.17.81.243 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-prod:latest'
             }
         }
    }

        stage('Manage Develop Branch') {
            when {
                branch "develop"
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'jenkins_credentials', keyFileVariable: '')]) {
                sh 'ssh ec2-user@3.92.201.200 sudo  docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-dev:latest'
                   }
                }
            }
        }
   }
    

