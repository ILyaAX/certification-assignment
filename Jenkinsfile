pipeline {
	agent none
	stages {
		stage ('Build docker image boxfuse & push artifact.ml') {
			agent any
			steps {
				sh 'terraform init -input=false'
                sh 'terraform plan -input=false'
                sh 'terraform apply -input=false'
			}
		}
	}
}