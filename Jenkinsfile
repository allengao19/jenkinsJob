pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Use Maven as a build tool
                sh 'mvn clean install'
            }
        }
        stage('Unit and Integration Tests') {
            steps {
                // Use JUnit or TestNG for running tests
                sh 'mvn test'
            }
        }
        stage('Code Analysis') {
            steps {
                // Use Eslint for code analysis
                sh 'npx eslint .'
            }
        }
        stage('Security Scan') {
            steps {
                // Use OWASP Dependency-Check as security scanning tool
                sh 'dependency-check.sh --project MyProject --scan ./ -f ALL'
            }
        }
        stage('Deploy to Staging') {
            steps {
                // use heroku to stage
                sh '''
                heroku login --api-key $HEROKU_API_KEY
                heroku git:remote -a jenkins-job
                git push heroku master
                '''
            }
        }
        stage('Integration Tests on Staging') {
            steps {
                sh 'bash integration-tests.sh'
            }
        }
        stage('Deploy to Production') {
            steps {
                // use heroku to deploy
                sh '''
                heroku login --api-key $HEROKU_API_KEY
                heroku git:remote -a jenkins-job
                git push heroku master
                '''
            }
        }
    }
    post {
        success{
            mail to: 'allengao1215@gmail.com',
                 subject: "Build Status Email",
                 body: "Build was successful."
        }
    }
}