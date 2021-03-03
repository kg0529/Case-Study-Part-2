pipeline{
	agent any
        
	stages{
                //Jenkins will do a git polling every 15mins, start a new deployment if any changes are found
		//remove previous existing repository then clone down the repository

		stage('check-out'){
			steps{
				checkout scm
			}
		}
		stage('Deploy'){
			steps{
                                //Jenkins tells ansible to start the deployment
                                //ansible will build the image, push it to dockerhub (done on host machine)
                                //ansible then will deploy the application on target machine using kubernetes

				script {
					sh 'ansible-playbook flask-playbook.yml'
				}
			}
		}
	}
}
