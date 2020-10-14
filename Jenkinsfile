pipeline {
    agent any
    
    environment {
        def SF_CONSUMER_KEY = "${env.SF_CONSUMER_KEY}"
        def SF_USERNAME = "${env.SF_USERNAME}"
        SERVER_KEY_ID = credentials('29cc9059-e7f3-449c-8e94-92a6961a548b')
        def SF_INSTANCE_URL = "${env.SF_INSTANCE_URL}"

        
        def toolbelt = tool 'sfdx'
        PATH = "C:\\Windows\\System32"
    }

    stages {

        stage ('Authorize to Salesforce') {
            steps {
               script {
                    bat "\"${toolbelt}\" force:auth:jwt:grant --clientid ${SF_CONSUMER_KEY} --username ${SF_USERNAME} --jwtkeyfile \"${SERVER_KEY_ID}\" --setdefaultdevhubusername --instanceurl ${SF_INSTANCE_URL} --setalias HubOrg2"
               }
            }
        }

        stage ('Create a dev sandbox org') {
            steps {
                script {
                    bat "\"${toolbelt}\" force:org:create --type sandbox --targetusername HubOrg2 --definitionfile config/developer-sandbox-def.json -a MyDevSandbox -s -w 30"
                }
            }
        }
    }
}