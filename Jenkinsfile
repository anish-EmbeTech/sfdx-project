pipeline {
    agent any
    
    environment {
        def SF_CONSUMER_KEY = env.SF_CONSUMER_KEY
        def SF_USERNAME = env.SF_USERNAME
        def SERVER_KEY_ID = env.SERVER_KEY_ID
        def SF_INSTANCE_URL = env.SF_INSTANCE_URL

        HOME = env.WORKSPACE
        def toolbelt = tool 'sfdx'
        PATH = "C:\\Windows\\System32"
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