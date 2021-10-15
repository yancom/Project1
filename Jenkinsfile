pipeline {
  agent any
    stage('Example') {
      try {
          sh 'exit 1'
      }
      catch (exc) {
          echo 'Something failed, I should sound the klaxons!'
          throw
      }
    }
  stages {
    stage('Pull') {
      steps {
        echo 'Pull from GitHub'
      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt1'
        sh 'ls'
        sh 'pwd'
        sh './Jenkins/build.sh'
      }
    }

    stage('PrintBuild') {
      steps {
        echo 'Print Build Number'
      }
    }

  }
}
