pipeline {
    agent any
 
    tools {
        maven 'LocalMaven'
    }
 
stages{
        stage('Build'){
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
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
