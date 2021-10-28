pipeline {
	
    agent {label 'master'}
    stages {
	stage ('Checkout') {
            steps {
		//git 'https://github.com/Sanjayde/jenkins-approval-assign.git'
                sh 'echo "Checkout Complete.........."'
                }
            }  
        stage('Docker Build') {
            steps {
		    sh '''#!/bin/bash -l
		if sudo docker ps -a | grep maven-app;then sudo docker stop maven-app && sudo docker rm maven-app; else exit 0; fi
	        sudo docker build -t maven-app:test .
            }
        }
	stage('Approval Step'){
            steps{
                
                //----------------send an approval prompt-------------
                script {
		timeout(time: 10, unit: 'MINUTES') {
                   env.APPROVED_DEPLOY = input message: 'User input required',
                   parameters: [choice(name: 'Deploy?', choices: 'no\nyes', description: 'Choose "yes" if you want to deploy this build')]
		   		}
                       }
                //-----------------end approval prompt------------
            }
        }
        stage ('Docker Push ECR') {
	when {
                environment name:'APPROVED_DEPLOY', value: 'yes'
            }
            steps {
		    sh 'sudo docker tag maven-app:test ${ECR_SERVER}:${BUILD_NUMBER}'
		    sh 'sudo docker push ${ECR_SERVER}:${BUILD_NUMBER}'
       	    }
        }
  }
}
