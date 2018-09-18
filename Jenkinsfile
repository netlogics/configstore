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
          def server = Artifactory.server 'artifactory'
          def uploadSpec = """{
            "files": [
              {
                "pattern": "${env.WORKSPACE}/Jenkinsfile",
                "target": "configstore-pipeline"
              },
              {
                "pattern": "${env.WORKSPACE}/config_store.rb",
                "target": "configstore-pipeline/src/"
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