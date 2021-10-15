pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        echo "BUILD_NUMBER ${BUILD_NUMBER}"
        echo "BUILD_ID ${BUILD_ID}"
        echo "BUILD_DISPLAY_NAME ${BUILD_DISPLAY_NAME}" 
        echo "JOB_NAME ${JOB_NAME}" 
        echo "BUILD_TAG ${BUILD_TAG}" 
        echo "EXECUTOR_NUMBER ${EXECUTOR_NUMBER}"
        echo "NODE_NAME ${NODE_NAME}" 
        echo "NODE_LABELS ${NODE_LABELS}" 
        echo "WORKSPACE${WORKSPACE}"
        echo "JENKINS_HOME ${JENKINS_HOME}" 
        echo "JENKINS_URL ${JENKINS_URL}" 
        echo "BUILD_URL ${BUILD_URL}"
        echo "JOB_URL${JOB_URL}" 
        
        
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
        echo "current build number: ${currentBuild.number}"
      }
    }

  }
}
