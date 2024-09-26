pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clona tu repositorio desde GitHub especificando la rama
                git branch: 'main', url: 'https://github.com/Johnny1808/DesafioYape.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Instala las dependencias del proyecto
                sh 'mvn clean install'
            }
        }
        stage('Run Karate Tests') {
            steps {
                // Ejecuta los tests de Karate
                sh 'mvn test'
            }
        }
    }
    post {
        always {
            // Genera reportes o logs después de la ejecución
            junit '**/target/surefire-reports/*.xml'
        }
    }
}
