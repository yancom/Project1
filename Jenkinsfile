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
        
        try {
         build 'sh "./Jenkins/build.sh"'
        } catch(error) {
         echo "First build failed, let's retry if accepted"
         retry(2) {
            input "Retry the job ?"
            build 'sh "./Jenkins/build.sh"'
          }
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
