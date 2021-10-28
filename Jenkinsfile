pipeline {
	
    agent {label 'master'}
    stages {
	stage ('Checkout') {
            steps {
                sh 'echo "Checkout Complete.........."'
                }
            }  
        stage('Docker Build') {
            steps {
                sh 'sudo docker build -t app:v1 .'
            }
        }
	stage('Approval Step'){
            steps{
                
                //----------------send an approval prompt-------------
                script {
                   env.APPROVED_DEPLOY = input message: 'User input required',
                   parameters: [choice(name: 'Deploy?', choices: 'no\nyes', description: 'Choose "yes" if you want to deploy this build')]
                       }
                //-----------------end approval prompt------------
            }
        }
        stage ('Docker Push ECR') {
            steps {
		    sh 'echo "docker pushed"'
        }
    }
  }
}
