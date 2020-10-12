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
               rc = command "${toolbelt}/sfdx force --help"
               echo "${rc}"
            }
        }
    }
}