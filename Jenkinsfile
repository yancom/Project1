pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        git(url: 'https://github.com/yancom/Project1.git', branch: 'main', poll: true)
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
        script {
          last_started = env.STAGE_NAME
          try {
            sh 'ls'
            sh 'pwd'
            sh './Jenkins/build.sh'
          } catch(error) {
            echo "Scrip fail , let's retry ... "

            retry(2) {
              echo "Scrip fail , let's retry ... "
              sh './Jenkins/build.sh'
              echo "cccc , let's retry ... "
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

        echo "current build number: ${currentBuild.number}"
      }
    }

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