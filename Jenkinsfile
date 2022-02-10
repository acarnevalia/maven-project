pipeline {
    agent any

     tools {
             maven 'LocalMaven'
     }
    
     environment {
    //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    IMAGE = readMavenPom().getArtifactId()
    // VERSION = readMavenPom().getVersion()
    VERSION = "github"
    TARGETNAME = "tomcatwebapp"
    }

    stages {
        stage('Build') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL} Workspace ${env.WORKSPACE} JobName ${env.JOB_NAME} Pom_Version ${VERSION}  Pom_ArtifactImage ${IMAGE}"
                bat 'mvn clean package'
                // Problema. Crea sempre una nuova immagine!!!
                bat "docker build . --rm -t ${TARGETNAME}:${VERSION}"  // ma cosi crea ogni volta una nuova immagine. qualcosa non e' corretto
                // bat "docker rmi $(docker images -f dangling=true -q)"
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
