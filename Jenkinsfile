pipeline {
    agent any
 
    tools {
        maven 'LocalMaven'
    }
 
stages{
        stage('Build'){
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL} JobName ${env.JOB_NAME} Workspace ${env.WORKSPACE)"
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
