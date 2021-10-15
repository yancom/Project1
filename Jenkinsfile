
String branchName = env.BRANCH_NAME
String gitCredentials = "yancom"
String repoUrl = "https://github.com/yancom/Project1.git"

pipeline {
  agent any
  stages {   
    stage('Pull') {
      steps {
        echo 'Pull from GitHub 11'  
        #sh 'ls'
        #sh 'pwd'
        #sh 'chmode +x ./Jenkins/build.sh'
        #git 'https://github.com/yancom/Project1.git'
        
        // Clones the repository from the current branch name
        echo 'Make the output directory'
        sh 'mkdir -p build'

        echo 'Cloning files from (branch: "' + branchName + '" )'
        dir('build') {
            git branch: branchName, credentialsId: 	gitCredentials, url: repoUrl
        }  
        
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
