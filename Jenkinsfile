pipeline {
    agent any
    tools {
            terraform 'terraform'
    }

    environment {
        DO_TOKEN     = credentials('do_token')
        PVT_KEY     = credentials('pvt_key')
        PUB_KEY     = credentials('pub_key')                         
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
        stage('Terraform plan') {
            steps {
               sh 'terraform plan -var "do_token=$DO_TOKEN" -var "pub_key=$PUB_KEY" -var "pvt_key=$PVT_KEY" -var "ssh_fingerprint=$SSH_FINGERPRINT"'
            }
        }
        stage('Apply / Destroy') {
            steps {
               sh 'terraform apply -var "do_token=$DO_TOKEN" -var "pub_key=$PUB_KEY" -var "pvt_key=$PVT_KEY" -var "ssh_fingerprint=$SSH_FINGERPRINT" --auto-approve'
            }

        }
    }
}
