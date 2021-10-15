pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
        echo 'Start Pull from GitHub'
        git(url: 'https://github.com/yancom/Project1.git', branch: 'main', poll: true)
        echo 'End Pull from GitHub'
        
        echo "current build number: ${currentBuild.number}"
        echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
        def causes = currentBuild.rawBuild.getCauses()
        echo "causes: ${causes}"
        def rebuildCause0 = currentBuild.rawBuild.getCause(com.sonyericsson.rebuild.RebuildCause)
        echo "rebuildCause0: ${rebuildCause0}"
        echo "rebuild up number: ${rebuildCause0.getUpstreamBuild()}"
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
            
            echo "current build number: ${currentBuild.number}"
            echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
            def causes = currentBuild.rawBuild.getCauses()
            echo "causes: ${causes}"
            def rebuildCause0 = currentBuild.rawBuild.getCause(com.sonyericsson.rebuild.RebuildCause)
            echo "rebuildCause0: ${rebuildCause0}"
            echo "rebuild up number: ${rebuildCause0.getUpstreamBuild()}"
            
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
        
        echo "current build number: ${currentBuild.number}"
        echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
        def causes = currentBuild.rawBuild.getCauses()
        echo "causes: ${causes}"
        def rebuildCause0 = currentBuild.rawBuild.getCause(com.sonyericsson.rebuild.RebuildCause)
        echo "rebuildCause0: ${rebuildCause0}"
        echo "rebuild up number: ${rebuildCause0.getUpstreamBuild()}"
      }
    }

  }
}
