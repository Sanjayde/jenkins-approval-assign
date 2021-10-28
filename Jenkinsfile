pipeline {
	
    agent master
    stages {
	stage ('Checkout') {
            steps {
                sh 'echo "Checkout Complete.........."'
                }
            }
        }
		  
        stage('Docker Build') {
            steps {
                sh 'sudo docker build -t app:v1 .'
            }
        }
	stage('Approval')
	input{
		message " Proceed  ?"
	}
        stage ('Docker Push ECR') {
            steps {
		    sh 'echo "docker pushed"'
        }
    }
}
