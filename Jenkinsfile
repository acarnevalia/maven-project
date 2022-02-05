pipeline {
    agent any
 
    tools {
        maven 'LocalMaven'
    }
 
stages{
        stage('Build'){
            steps {
                  echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL} JobName ${JOB_NAME} Workspace ${WORKSPACE)"
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
