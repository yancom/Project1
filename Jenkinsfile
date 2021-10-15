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
        try {
          sh 'ls'
          sh 'pwd'
          sh './Jenkins/build.sh'
        } catch(error) {
          echo "Scrip fail , let's retry if accepted"
          retry(2) {               
            sh './Jenkins/build.sh'
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
