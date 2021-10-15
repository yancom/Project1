pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        echo 'Start Pull from GitHub'
        #sh 'ls'
        #sh 'pwd'
        git 'https://github.com/yancom/Project1.git'
        echo 'End Pull from GitHub'
      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt'
        script {
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
    }

    stage('PrintBuild') {
      steps {
        echo 'Print Build Number'
      }
    }

  }
}
