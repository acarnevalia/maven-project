pipeline {
    agent any
 
    tools {
        maven 'LocalMaven'
    }
 
stages{
        stage('Build'){
            echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            steps {
                bat 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
    }
}
