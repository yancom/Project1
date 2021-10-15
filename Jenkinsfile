pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        echo "current build number: ${currentBuild.number}"
        echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
        echo 'Start Pull from GitHub'
        git(url: 'https://github.com/yancom/Project1.git', branch: 'main', poll: true)
        echo 'End Pull from GitHub'
      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt'
        script {
          try {
            echo "current build number: ${currentBuild.number}"
            echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
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
        echo "current build number: ${currentBuild.number}"
        echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
      }
    }

  }
}
