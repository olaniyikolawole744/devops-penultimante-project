# Direction Application

This project is to create AMI using Packer, VPC and nodes for (Jenkins, prodd and dev servers) using Terraform, install softwares using Ansible (git, jenkins, docker),  then build a java code into an image and run the image on dev and prod remote nodes.

### Requirements 

```
JDK/Java-8
mvn
```
### To build the app locally first on the local machine
```
git clone repo code
cd code
mvn clean package
cp target/*.jar /tmp/direction.jar
```

### To run the app locally on the machine
```
cp target/*.jar /tmp/direction.jar
java -jar /tmp/direction.jar
loginname=myname loginpass=mypass api_key=my_google_api_key java -jar /tmp/direction.jar
```

## TASK EXECUTION

### CREATE VPC
```
- cd vpc-module 
- terraform init
- terraform apply '-var-file=vpc.tfvars' --auto-approve
- cd ..
```


### CREATE AMI
```
- cd packer 
- packer build linux.json
- cd ..
```

### CREATE NODES
```
- cd server
- cd ansible-node
- terraform init 
- terraform apply '-var-file=ansible.tfvars' --auto-approve
- cd ..
```

```
- cd devapp-node
- terraform init 
- terraform apply '-var-file=devapp.tfvars' --auto-approve
- cd ..
```

```
- cd jenkins-node
- terraform init 
- terraform apply '-var-file=jenkins.tfvars' --auto-approve
- cd ..
```


```
- cd prodapp-node
- terraform init 
- terraform apply '-var-file=prodapp.tfvars' --auto-approve
- cd ..
- cd ..
```

### SETUP INSTALLATIONS AND CONFIGURATIONS
```
- cd ansible-jobs
- edit host file
- ansible-playbook playbook/playbook.yml -i inventory/hosts/host
- cd ..
```

### RUN JENKINS
```
- setup mutlibranch pipeline on jenkins to run jenkins pipeline
```
