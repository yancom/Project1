pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        echo 'Pull from GitHub'
      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt'
        sh 'ls'
        sh 'pwd'
        sh './Jenkins/build.sh'
        catchError(buildResult: 'fail', message: 'Build fail', stageResult: 'fail') {
          echo 'test try'
        }

        catchError(buildResult: 'fail', catchInterruptions: true, message: 'dksjdhaj', stageResult: 'fail') {
          sh 'sh "./Jenkins/build.sh"'
        }

      }
    }

    stage('PrintBuild') {
      steps {
        echo 'Print Build Number'
      }
    }

  }
}