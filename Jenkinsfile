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
        
		stage ('Build webapp image') {
			steps {
                ansiblePlaybook become: true, credentialsId: '48e5872b-378a-4763-9a0e-45a67aa1c7e6', inventory: 'hosts', playbook: 'build.yml'
            }
		}	
	}
}