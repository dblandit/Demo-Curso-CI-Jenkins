pipeline {
    agent { docker { image 'node:12.18.4' } }
    options {
        timeout(time: 1, unit: 'HOURS') 
        timestamps()
    }
    stages {
        stage("Docker image") {
            agent { docker { image 'docker:19.03.12' } }
            //Podríamos limitar cuándo correr
            // when {
            //   anyOf {
            //     branch 'dev'
            //     branch 'master'
            //    }
            // }
            steps {
                
                script {
                    docker.withRegistry('https://registry.gitlab.com', 'gitlab-registry') {

                        def imagenDocker = docker.build("registry.gitlab.com/dblandit-open-workshops/curso-ci-jenkins:${BUILD_TAG}")

                        imagenDocker.push()
                    }
                }
            }
        }
    }
}

