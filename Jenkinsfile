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
        sh 'Jenkins/build.sh'
      }
    }

    stage('PrintBuild') {
      steps {
        echo 'Print Build Number'
      }
    }

  }
}