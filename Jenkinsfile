pipeline {
  agent any
  stages {   
    stage('Pull') {
      steps {
        echo 'Pull from GitHub'
        script{
          try {
             build 'yourJob'
          } catch(error) {
             echo "First build failed, let's retry if accepted"
             retry(2) {
                input "Retry the job ?"
                build 'yourJob'
             }
          }
        }
      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt1'
        sh 'ls'
        sh 'pwd'
        sh './Jenkins/build.sh'
      }
    }

    stage('PrintBuild') {
      steps {
        echo 'Print Build Number'
      }
    }

  }
}
