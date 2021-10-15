
pipeline {
  agent any
  stages {   
    stage('Pull') {
      steps {
        echo 'Pull from GitHub 11'  
        sh 'ls'
        sh 'pwd'
        #sh 'chmode +x ./Jenkins/build.sh'
        git url: 'https://github.com/jfrogdev/project-examples.git' 'https://github.com/yancom/Project1.git'
                
      }
    }

    stage('RunScript') {
      steps {
        echo 'Run the Scrpt'
        script{
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
