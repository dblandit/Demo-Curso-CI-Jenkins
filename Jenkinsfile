pipeline {
    agent { docker { image 'node:12.18.4' } }
    options {
        timeout(time: 1, unit: 'HOURS') 
        timestamps()
    }
    stages {
        stage('Deploy') {
            environment {
                SUPER_SECRET = credentials("user-pass-secreto")
            }
            input {
                message "Seleccione ambiente"
                ok "Desplegar!"
                //submitter "dblandit" <-- Podriamos indicar quien puede contestar
                parameters {
                    choice(name: 'AMBIENTE', choices: ['Dev', 'Staging', 'Prod'], description: 'A qué ambiente desplegamos?')
                }
            }
            steps {
                sh "echo ${AMBIENTE}"
                sh "echo $AMBIENTE"
                sh "echo $SUPER_SECRET_USR"
                sh "echo $SUPER_SECRET_PSW"
                sh 'echo $SUPER_SECRET_USR'
                sh 'echo $SUPER_SECRET_PSW'
                sh 'echo $AMBIENTE'
            }
        }
    }
}

