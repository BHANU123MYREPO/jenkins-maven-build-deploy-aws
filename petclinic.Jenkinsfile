
pipeline {
    agent {
        label 'JENKINS-AGENT'
    }

    tools {
        maven 'MAVEN_HOME'
        
    }

    environment {
        DOCKER_HUB_REPO = 'pavankumarindian/petclinic-java-maven-app'
        DOCKER_HUB_CREDENTIALS = 'DockerCreds'
        EC2_INSTANCE_IP = '10.0.0.38'
        PRIVATE_KEY_PATH = "/home/jenkins/.ssh/id_rsa"
    }

    stages {
        stage('Workspace Cleaning') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout from GitHub') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/pavankumarindian/jenkins-maven-build-deploy-aws.git'
                }
            }
        }

        stage('Install Java Build Tools') {
            steps {
                script {
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y maven'
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh 'mvn clean install'
                    sh 'docker build -t ${DOCKER_HUB_REPO}:latest -f Dockerfile .'
                    withDockerRegistry(credentialsId: DOCKER_HUB_CREDENTIALS, toolName: 'docker') {
                        sh "docker push ${DOCKER_HUB_REPO}:latest"
                    }
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    // SSH into the EC2 instance and deploy the Docker container
                    sh "ssh -i ${PRIVATE_KEY_PATH} jenkins@${EC2_INSTANCE_IP} 'docker pull ${DOCKER_HUB_REPO}:latest'"
                    sh "ssh -i ${PRIVATE_KEY_PATH} jenkins@${EC2_INSTANCE_IP} 'docker run -d -p 8888:8080 ${DOCKER_HUB_REPO}:latest'"
                }
            }
        }
    }
    post {
        always {
            mail bcc: '', body: """'Project: ${env.JOB_NAME}<br/> Build Number: ${env.BUILD_NUMBER}<br/> URL: ${env.BUILD_URL}'""", cc:'', from: '', replyTo: '', subject: "${currentBuild.result}'", to: 'pavankumargudipati1995@gmail.com'
        }
    }
}
