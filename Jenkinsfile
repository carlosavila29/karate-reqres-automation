pipeline {
    // 1. Dónde se ejecutará la tarea (en cualquier agente disponible)
    agent any

    // 2. Herramientas necesarias (le decimos que necesitamos Maven)
    tools {
        maven 'MAVEN_HOME' // Usaremos este nombre para configurar Maven en Jenkins
    }

    // 3. Los pasos o "etapas" de nuestro proceso
    stages {
        // Etapa 1: Descargar el código desde GitHub
        stage('Checkout') {
            steps {
                echo 'Descargando el código desde el repositorio...'
                checkout scm
            }
        }

        // Etapa 2: Ejecutar las pruebas de Karate con Maven
        stage('Build & Test') {
            steps {
                echo 'Ejecutando pruebas con Maven...'
                // En Mac/Linux se usa 'sh' para ejecutar comandos de terminal
                sh 'mvn clean test -Dtest=api.reqres.ReqresRunner'
            }
        }
    }

    // 4. Acciones a realizar después de la ejecución (incluso si falla)
    post {
        always {
            echo 'Publicando reportes HTML...'
            // Publica el reporte de Karate para que se vea en Jenkins
            publishHTML(target: [
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'target/karate-reports',
                reportFiles: 'karate-summary.html',
                reportName: 'Reporte de Karate'
            ])
        }
    }
}