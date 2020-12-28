pipeline {
    agent { docker { image 'node:12.18.4' } }
    options {
        timeout(time: 1, unit: 'HOURS') 
        timestamps()
    }
    stages {
        stage('build') {
            parallel {
                stage("Build Android")
                {
                    steps {
                        sh 'echo Aca hacemos el build para Android, por ejemplo con gradle'
                    }
                }
                stage("Build iOS")
                {
                    steps {
                        sh 'echo Aca hacemos el build para iOS, por ejemplo con XCode'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                sh 'echo Hola Mundo > hola.txt'
            }
            post {
                always {
                    archiveArtifacts 'hola.txt'
                }
            }
        }
    }
}

