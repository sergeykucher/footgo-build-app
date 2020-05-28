pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        stage('build') {
            steps {
                powershell label: '', script: 'docker build -t footgo_build .'
                powershell label: '', script: 'docker run --rm --name build -v ${PWD}:/footgo -w /footgo footgo_build mvn clean package'
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'footgo', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'eu-central-1', showDirectlyInBrowser: false, sourceFile: '**/target/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'S3_Jenkins', userMetadata: []
            }
        }
    }   
}
