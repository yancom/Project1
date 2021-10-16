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
          num_retrys = 0
          try {
            set +x //hide from console
            sh 'ls'
            sh 'pwd'
            set -x //show in console
            sh './Jenkins/build.sh'

          } catch(error) {
            echo "EXECUTOR_NUMBER22  =$EXECUTOR_NUMBER"
            echo "Scrip fail , let's retry "
            echo "retry $num_retrys of 3"
            retry(2) {
              echo "retry"
              sh './Jenkins/build.sh'

              //num_retrys=$num_retrys+1

              //echo "retry $num_retrys of 3"
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
