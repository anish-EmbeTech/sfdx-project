pipeline {
    agent any

    stages {
        stage ('git checkout') {
            steps {
                checkout scm
            }
        }

        stage ('Authorize to Salesforce') {
            steps {
                sfdx force --help
            }
        }
    }
}