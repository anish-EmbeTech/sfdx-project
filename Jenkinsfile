pipeline {
    agent any
    
    environment {
        def SF_CONSUMER_KEY = "${env.SF_CONSUMER_KEY}"
        def SF_USERNAME = "${env.SF_USERNAME}"
        SERVER_KEY_ID = credentials('974b90fb-1886-44c5-baa1-244fb1fe8a10')
        def SF_INSTANCE_URL = "${env.SF_INSTANCE_URL}"
        def TEST_LEVEL='RunLocalTests'
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

        stage ('validate to sandbox') {
            steps {
                script {
                    bat "mkdir src"
                    bat "\"${toolbelt}\" force:source:convert -d src"
                    bat "\"${toolbelt}\" force:mdapi:deploy --checkonly --wait 10 -d src --targetusername HubOrg2"  
                }
            }
        }

        stage ('run tests') {
            steps {
                script {
                    bat "\"${toolbelt}\" force:apex:test:run --targetusername HubOrg2 --wait 10 --resultformat tap --codecoverage --testlevel ${TEST_LEVEL}"  
                }
            }
        }

        stage ('deploy to sandbox') {
            steps {
                script {
                    bat "\"${toolbelt}\" force:mdapi:deploy --wait 10 -d src --targetusername HubOrg2"
                }
            }
        } 
    }
}