pipeline {
  agent any
  stages {
    stage('Pull111') {
      steps {
         try {
           echo 'exit Pull from GitHub1111'
            sh 'exit 1'
        }
        catch (exc) {
            echo 'Something failed, I should sound the klaxons!'
            
        }
        
      }
    }
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
