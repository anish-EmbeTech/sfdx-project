pipeline {
    agent any

    stages {
        stage ('git checkout') {
            steps {
                git credentialsId: 'embe-github', url: 'https://github.com/anish-EmbeTech/sfdx-project'
            }
        }
    }
}