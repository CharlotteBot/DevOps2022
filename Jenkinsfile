pipeline {
  agent any
  stages {
		stage('Login server') {
			steps {
				sshagent(credentials:['UbuntuLogin']) {
					sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.188.123.136'
				}
				echo "success login"
			}
		}
		stage('Docker build') {
			steps {
				sh 'docker build --platform linux/amd64 -t mgrosmaninho/devops2022:0.01 .'
			}
		}
		stage('Docker login') {
			steps {
				withCredentials([string(credentialsId: 'DockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
					sh "docker login -u ${USERNAME} -p ${PASSWORD}"
				}
			}
		}
		stage('Docker push') {
			steps {
				sh 'docker push mgrosmaninho/devops2022:0.01'
			}
		}
  }
	post {
		always {
			mail to: 'mgrosmaninho@hotmail.com',
			subject: 'Worked!!!',
			body: 'Website Jenkins pipeline worked'
		}
		failure {
		  mail to: 'mgrosmaninho@hotmail.com',
			subject: 'Worked!!!',
			body: 'Website Jenkins pipeline worked'	
		}
	}
}