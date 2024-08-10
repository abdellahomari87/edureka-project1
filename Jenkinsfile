pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/abdellahomari87/edureka-project1.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    timeout(time: 20, unit: 'MINUTES') {
                        dockerImage = docker.build("omari87/1:latest")
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sshagent(credentials: ['ec2-user']) {
                    sh 'ssh -o StrictHostKeyChecking=no -i /mnt/chromeos/MyFiles/Downloads/kubernetes-task.pem ec2-user@13.37.250.1 ansible-playbook /home/ec2-user/deploy_kubernetes.yml -i /home/ec2-user/inventory'
                }
            }
        }
    }
}
