pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Descargando el código desde el repositorio...'
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                echo 'Ejecutando pruebas con Maven...'
                sh 'mvn clean test -Dtest=api.reqres.ReqresTests'
            }
        }
    }

    post {
        always {
            echo 'Publicando reportes HTML...'
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'target/karate-reports',
                reportFiles: 'karate-summary.html',
                reportName: 'Reporte de Karate'
            ])
        }
    }
}