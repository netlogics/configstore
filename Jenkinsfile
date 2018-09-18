pipeline {
  agent {
    docker {
      image 'node:6-alpine'
      args '-p 3000:3000'
    }

  }
  stages {
    stage('deliver') {
      steps {
        script {
          echo $WORKSPACE
          def server = Artifactory.server 'artifactory'
          def uploadSpec = """{
            "files": [
              {
                "pattern": "Jenkinsfile",
                "target": "configstore-pipeline"
              }
            ]
          }"""
          def buildInfo = server.upload(uploadSpec)
          buildInfo.env.capture = true
          server.publishBuildInfo buildInfo
        }

        input 'Finished using the web site? (Click "Proceed" to continue)'
      }
    }
  }
  environment {
    CI = 'true'
  }
}