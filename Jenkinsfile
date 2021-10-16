pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        git(url: 'https://github.com/yancom/Project1.git', branch: 'main', poll: true)
        echo "FOO is '${RETRY_COUNT}'"
        echo "FOO is '${RETRY_COUNT}+1'"
        echo 'End Pull from GitHub '
        script {
          last_started = env.STAGE_NAME
          first_job = env.STAGE_NAME
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
            sh 'ls'
            sh 'pwd'
            sh './Jenkins/build.sh'
          } catch(error) {
            //currentBuild.result = "FAILURE"
            //println("catch exeption. currentBuild.result: ${currentBuild.result}")
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
  environment {
    RETRY_COUNT = '0'
    FOO = 'initial FOO env value'
  }
  post {
    success {
      echo "the first stage was $first_job"
    }

    failure {
      script {
        echo "Failed stage names $last_started"
      }

    }

  }
}