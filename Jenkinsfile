pipeline {
    agent { docker { 
        image 'node:12.18.4' 
        args '--network=mongotesting'
    } }
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
        stage("test") {
            options {
                timeout(time: 2, unit: 'HOURS') 
                retry(3)
            }
            environment {
                MONGO_URI = "mongodb://mongo${BUILD_TAG}:27017/db-test"
            }
            steps {
                script {
                    docker.image('mongo:4.2.2').withRun("--name=mongo${BUILD_TAG} --network=mongotesting") { c ->
                        sh 'npm install'
                        sh 'npm run test:ci'
                    }
                }
            }
            post {
                always {
                    junit 'junit.xml'
                }
            }
        }
        stage("Docker image") {
            agent { docker { image 'docker:19.03.12' } }
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