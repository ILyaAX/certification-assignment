pipeline {
	agent none
	stages {
		stage ('Build docker image boxfuse & push artifact.ml') {
			agent any
			steps {
                withAWS(credentials: 'a948fda2-a2f2-4df2-a67a-eff122985006') {
				sh 'terraform init -input=false'
                sh 'terraform plan -input=false'
                sh 'terraform apply -input=false'
                }
			}
		}
	}
}