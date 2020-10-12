pipeline {
    agent any

    def toolbelt = tool 'sfdx'

    stages {
        stage ('git checkout') {
            steps {
                checkout scm
            }
        }

        stage ('Authorize to Salesforce') {
            steps {
                command "${toolbelt}/sfdx force --help"
            }
        }
    }
}