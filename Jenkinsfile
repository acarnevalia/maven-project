pipeline {
    agent any

     tools {
             maven 'LocalMaven'
     }
    
     environment {
    //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    IMAGE = readMavenPom().getArtifactId()
    VERSION = readMavenPom().getVersion()
    }

    stages {
        stage('Build') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL} Workspace ${env.WORKSPACE} JobName ${env.JOB_NAME} Pom_Version ${VERSION}  Pom_ArtifactImage ${IMAGE}"
                bat 'mvn clean package'
                bat "docker build . -t tomcatwebapp:${env.BUILD_ID}"
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

    }
}
