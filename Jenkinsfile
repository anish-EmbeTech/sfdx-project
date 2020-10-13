pipeline {
    agent any
    
    environment {
        def toolbelt = tool 'sfdx'
        env.PATH = env.PATH + ";C:\\Windows\\System32"
    }

    stages {

        stage ('Authorize to Salesforce') {
            steps {
               script {
                   println("inside script block");
                   bat '%toolbelt%/sfdx force --help'
               }
            }
        }
    }
}