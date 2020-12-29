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
    }
}