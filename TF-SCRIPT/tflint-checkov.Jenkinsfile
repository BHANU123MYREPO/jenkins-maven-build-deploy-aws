pipeline {
  agent {
      label 'JENKINS-AGENT'
  }

  stages {
    stage('Prerequisites') {
      steps {
        script {
          sh "whoami"
          sh "sudo apt-get update"
          sh "sudo apt-get install unzip"
          sh 'curl -L https://github.com/terraform-linters/tflint/releases/latest/download/tflint_linux_amd64.zip -o tflint.zip'
          sh 'unzip -o tflint.zip'
          sh 'sudo mv tflint /usr/local/bin/'
          sh 'rm tflint.zip'
          
          // Install Checkov
          sh 'sudo apt-get install pip -y'
          sh 'sudo pip install checkov'
        }
      }
    }

    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/pavankumarindian/jenkins-maven-build-deploy-aws.git'
      }
    }

    stage('TFLint') {
      steps {
        sh 'tflint --force'
      }
    }

    stage('Checkov') {
      steps {
        // Assuming your Terraform files are in a specific directory, adjust the path accordingly
        sh 'checkov -d /var/lib/jenkins/workspace/tflint-checkov'
        }
      }
    }
  }
