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
                bat 'mvn clean install'
            }
        }
        stage('Run Karate Tests') {
            steps {
                // Ejecuta los tests de Karate y genera los reportes en formato JUnit (XML)
                bat 'mvn test -Dkarate.options="--output-format junit"'
            }
        }
    }
    post {
        always {
            // Recoge los reportes de JUnit generados por Karate
            junit '**/target/surefire-reports/*.xml'

            // Opción para publicar los reportes HTML de Karate en Jenkins
            publishHTML([allowMissing: false,
                         alwaysLinkToLastBuild: true,
                         keepAll: true,
                         reportDir: 'target/karate-reports',
                         reportFiles: 'karate-summary.html',
                         reportName: 'Karate HTML Report'])
        }
    }
}