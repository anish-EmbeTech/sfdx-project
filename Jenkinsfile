pipeline {
    agent any
    
    environment {
        def SF_CONSUMER_KEY = "${env.SF_CONSUMER_KEY}"
        def SF_USERNAME = "${env.SF_USERNAME}"
        def SERVER_KEY_ID = "${env.SERVER_KEY_ID}"
        def SF_INSTANCE_URL = "${env.SF_INSTANCE_URL}"

        
        def toolbelt = tool 'sfdx'
        PATH = "C:\\Windows\\System32"
    }

    stages {

        stage ('Authorize to Salesforce') {
            steps {
               script {
                    withCredentials([file(credentialsId: SERVER_KEY_ID, variable: 'server_key_file')]) {
                        bat "\"${toolbelt}\" force:auth:jwt:grant --clientid ${SF_CONSUMER_KEY} --username ${SF_USERNAME} --jwtkeyfile \"${server_key_file}\" --setdefaultdevhubusername --instanceurl ${SF_INSTANCE_URL} --setalias HubOrg2"
                    }
               }
            }
        }

        stage ('Create a scratch org') {
            steps {
                script {
                    bat "\"${toolbelt}\" force:org:create --targetdevhubusername HubOrg2 --setdefaultusername --definitionfile config/project-scratch-def.json --setalias ciorg --wait 10 --durationdays 1"
                }
            }
        }
    }
}