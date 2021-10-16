pipeline {
  agent any
  stages {
    stage('Pull') {
      steps {
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
        echo 'Start Pull from GitHub'
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

import io.jenkins.blueocean.rest.impl.pipeline.PipelineNodeGraphVisitor
import io.jenkins.blueocean.rest.impl.pipeline.FlowNodeWrapper
import org.jenkinsci.plugins.workflow.support.steps.build.RunWrapper
import org.jenkinsci.plugins.workflow.actions.ErrorAction

// Get information about all stages, including the failure causes.
//
// Returns a list of maps: [[id, displayName, result, errors]]
// The 'errors' member is a list of unique exceptions.

@NonCPS
List<Map> getStageResults( RunWrapper build ) {

    // Get all pipeline nodes that represent stages
    def visitor = new PipelineNodeGraphVisitor( build.rawBuild )
    def stages = visitor.pipelineNodes.findAll{ it.type == FlowNodeWrapper.NodeType.STAGE }

    return stages.collect{ stage ->

        // Get all the errors from the stage
        def errorActions = stage.getPipelineActions( ErrorAction )
        def errors = errorActions?.collect{ it.error }.unique()

        return [ 
            id: stage.id, 
            displayName: stage.displayName, 
            result: "${stage.status.result}",
            errors: errors
        ]
    }
}

// Get information of all failed stages
@NonCPS
List<Map> getFailedStages( RunWrapper build ) {
    return getStageResults( build ).findAll{ it.result == 'FAILURE' }
}
