pipeline {
    agent any
    
    environment {
        def toolbelt = tool 'sfdx'
    }

    stages {

        stage ('Authorize to Salesforce') {
            steps {
               script {
                   println("inside script block");
                   "%toolbelt%/sfdx force --help"
               }
            }
        }
    }
}