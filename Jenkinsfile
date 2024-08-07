pipeline {
    agent none
    stages {
        stage('Build') {
            agent { label 'slave' } // Remplacez 'slave' par l'étiquette de votre nœud esclave
            steps {
                echo "Building on slave node"
                // Ajoutez vos étapes de build ici
                sh 'echo "Compiling the code"'
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            agent { label 'slave' } // Remplacez 'slave' par l'étiquette de votre nœud esclave
            steps {
                echo "Testing on slave node"
                // Ajoutez vos étapes de test ici
                sh 'echo "Running tests"'
                sh 'mvn test'
            }
        }
    }
}
