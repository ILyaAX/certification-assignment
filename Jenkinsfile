pipeline {
	agent any
	stages {
		stage ('Providing instances for the project') {
			steps {
                withAWS(credentials: 'a948fda2-a2f2-4df2-a67a-eff122985006') {
                sh 'terraform init -input=false'
                sh 'terraform plan -out=tf.plan -input=false'
                sh 'terraform apply -input=false tf.plan'
                }
			}
		}
        stage ('Waiting for AWS to be created') {
            steps {
             echo 'Waiting 2 min for AWS to be created'
             sleep 200
             }
          }
		stage ('Build webapp image') {
			steps {
                sh 'sudo ansible-playbook -i hosts build.yml'
            }
		}	
	}
}