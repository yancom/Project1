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
        sh 'chmod -R g+rwx /Jenkins'
        retry(count: 3) {
          sh 'sh "./Jenkins/build.sh"'
        }

        build(job: 'testJob', quietPeriod: 10)
      }
    }

    stage('PrintBuild') {
      steps {
        echo 'Print Build Number'
      }
    }

  }
}