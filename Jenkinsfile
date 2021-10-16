pipeline {
  agent any
  stages {
    stage('Poll') {
      steps {
        echo "STAGE_NAME = $STAGE_NAME"
        echo "before=$STAGE_NAME"
        echo "current projectName: ${currentBuild.projectName}"
        echo "current description: ${currentBuild.description}"
        echo "current displayName: ${currentBuild.displayName}"
        echo "BUILD_ID  =$BUILD_ID"
        echo "BUILD_DISPLAY_NAME  =$BUILD_DISPLAY_NAME"
        echo "JOB_NAME  =$JOB_NAME"
        echo "BUILD_TAG  =$BUILD_TAG"
        echo "EXECUTOR_NUMBER  =$EXECUTOR_NUMBER"
        echo "NODE_NAME  =$NODE_NAME"
        echo "NODE_LABELS  =$NODE_LABELS"
        echo "WORKSPACE =$WORKSPACE"
        echo "JENKINS_HOME  =$JENKINS_HOME"
        echo "JENKINS_URL  =$JENKINS_URL"
        echo "BUILD_URL  =$BUILD_URL"
        echo "JOB_URL =$JOB_URL"
        echo 'Start Poll from GitHub'
        git(url: 'https://github.com/yancom/Project1.git', branch: 'main', poll: true)
        echo 'End Pull from GitHub'
      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt'
        echo "EXECUTOR_NUMBER  =$EXECUTOR_NUMBER"
        script {
          try {

            sh 'ls'
            sh 'pwd'
            sh './Jenkins/build.sh'

          } catch(error) {
            echo "EXECUTOR_NUMBER22  =$EXECUTOR_NUMBER"
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
        echo "EXECUTOR_NUMBER  =$EXECUTOR_NUMBER"
        echo "current build number: ${currentBuild.number}"
      }
    }

  }
  post {
    failure {
      script {
        echo "Failed stage names"
      }

    }

  }
}