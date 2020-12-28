pipeline {
    agent { docker { image 'node:12.18.4' } }
    options {
        timeout(time: 1, unit: 'HOURS') 
        timestamps()
    }
    stages {
        stage('build') {
            steps {
                sh 'npm install'
            }
        }
        stage('build secuencial') {
            steps {
                sh 'echo Hacemos otro build pero secuencial!'
            }
        }
    }
}