pipeline {
    agent any
    tools {
            terraform 'terraform'
    }

    environment {
        DO_TOKEN     = credentials('do_token')
        PVT_KEY     = credentials('pvt_key')
        SSH_FINGERPRINT = credentials('ssh_fingerprint')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/kansola/terraform-project.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Apply / Destroy') {
            steps {
               sh 'terraform apply --auto-approve'
            }

        }
    }
}
