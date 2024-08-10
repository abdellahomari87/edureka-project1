pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/abdellahomari87/edureka-project1.git'
            }
        }
        stage('Run Ansible Playbook on EC2') {
            steps {
                sshagent(['671c494a-7800-4187-a640-1c93f057a80f']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no -i /mnt/chromeos/MyFiles/Downloads/kubernetes-task.pem ec2-user@13.37.250.1 '
                        ansible-playbook /home/ec2-user/deploy_kubernetes.yml -i /home/ec2-user/inventory
                    '
                    '''
                }
            }
        }
    }
}
