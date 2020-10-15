pipeline {
    agent any
    
    environment {
        def SF_CONSUMER_KEY = "${env.SF_CONSUMER_KEY}"
        def SF_USERNAME = "${env.SF_USERNAME}"
        SERVER_KEY_ID = credentials('29cc9059-e7f3-449c-8e94-92a6961a548b')
        def SF_INSTANCE_URL = "${env.SF_INSTANCE_URL}"

        SANDBOX_TYPE = "sandbox"
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

        stage ('deploy to sandbox') {
            steps {
                script {
                    bat "\"${toolbelt}\" force:source:convert -d src"
                    stdout = bat (returnStdout:true , script: "\"${toolbelt}\" force:mdapi:deploy --checkonly --wait 10 -d src --targetusername HubOrg2").trim()
                    println "${stdout}"
                    /*if (rc != 0) {
                        error 'validation failed'
                    }else {
                        bat "\"${toolbelt}\" force:mdapi:deploy --wait 10 -d src --targetusername HubOrg2 --json"
                    }*/
                }
            }
        }
    }
}