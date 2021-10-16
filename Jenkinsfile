pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        git(url: 'https://github.com/yancom/Project1.git', branch: 'main', poll: true)
        echo "FOO is '${RETRY_COUNT}'"
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
        echo "EXECUTOR_NUMBER =$EXECUTOR_NUMBER"
        script {
          last_started = env.STAGE_NAME
          try {
            sh 'ls'
            sh 'pwd'
            sh './Jenkins/build.sh'
          } catch(error) {
            echo "Scrip fail , let's retry "
            echo "Script fail $EXECUTOR_NUMBER out of 3 tries !!!"
            //env.EXECUTOR_NUMBER=env.EXECUTOR_NUMBER+1;
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
        echo "EXECUTOR_NUMBER =$EXECUTOR_NUMBER"
        echo "current build number: ${currentBuild.number}"
      }
    }
  }
  environment {
    RETRY_COUNT = '0'
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
