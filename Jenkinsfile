pipeline {
    agent any

    environment {
        DO_TOKEN     = credentials('do_token')
        PUB_KEY = credentials('pub-key')
        PVT_KEY     = credentials('pvt_key')
        SSH_FINGERPRINT = credentials('ssh_fingerprint')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kansola/terraform-project.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Apply / Destroy') {
            steps {
               sh 'terraform apply --auto-approve'
            }

        }
    }
}
