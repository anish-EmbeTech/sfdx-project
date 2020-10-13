pipeline {
    agent any

    environment {
        toolbelt = tool name: 'sfdx', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
    }

    stages {
        stage ('git checkout') {
            steps {
                checkout scm
            }
        }

        stage ('Authorize to Salesforce') {
            steps {
               echo "scripted block"
               script {
                   rc = "${toolbelt}/sfdx force:org --help"
                   if(rc == 0){
                       error 'command executed'
                   }
               }
            }
        }
    }
}