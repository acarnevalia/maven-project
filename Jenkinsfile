pipeline {
    agent any

     tools {
             maven 'LocalMaven'
     }

    stages {
        stage('Build') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL} JobName ${env.JOB_NAME} Workspace ${env.WORKSPACE}"
                bat 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                junit '**/target/surefire-reports/TEST-*.xml'
            }
        }
        
        stage('Deploy to Staging'){
            steps{
                echo 'Deploy to Staging..'
                build job: ('Deploy-To-Staging')
              }  
        }
        
        stage('Deploy to production'){
            step{
                echo 'Deploying to Production'
                timeout(time:5 units:'DAYS'){
                    input message: 'Approve PRODUCTION Deployment?'
                }
            }
            post{
                success{
                    echo 'Code deployed to production'
                }
                failure{
                    echo 'Deployment failed'
                }
            }
          
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
