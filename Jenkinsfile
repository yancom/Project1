pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        git(url: 'https://github.com/yancom/Project1.git', branch: 'main', poll: true)
        echo 'End Pull from GitHub'
        script {
          last_started = env.STAGE_NAME
        }

      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt'
        echo "EXECUTOR_NUMBER  =$EXECUTOR_NUMBER"
        script {
          last_started = env.STAGE_NAME

          try {
            echo 'aaaa1'
            set +x
            echo 'aaaa2'
            sh 'ls'
            echo 'aaaa3'
            sh 'pwd'
            echo 'aaaa4'
            set -x
            echo 'aaaa5'
            sh './Jenkins/build.sh'
            echo 'aaaa6'


          } catch(error) {
            currentBuild.result = "FAILURE"
            println("catch exeption. currentBuild.result: ${currentBuild.result}")
            echo "EXECUTOR_NUMBER22  =$EXECUTOR_NUMBER"
            echo "Scrip fail , let's retry "

            retry(2) {
              echo "retry ........"

              sh './Jenkins/build.sh'
            }
          }
        }

      }
    }

    stage('PrintBuild') {
      steps {
        script {
          last_started = env.STAGE_NAME
        }

        echo "EXECUTOR_NUMBER  =$EXECUTOR_NUMBER"
        echo "current build number: ${currentBuild.number}"
      }
    }

  }
  post {
    success {
      echo "last_started: $last_started"
    }

    failure {
      script {
        echo "Failed stage names $last_started"
      }

    }

  }
}