pipeline {
    agent any
    environment{
      HEROKU_API_KEY = 'f7dafc2b-d8fb-4442-b5da-f694b920d9c1'
    }
    stages {
        // stage('Build') {
        //     steps {
        //         // Use Maven as a build tool
        //         sh '/usr/local/bin/mvn clean install'
        //     }
        // }
        // stage('Unit and Integration Tests') {
        //     steps {
        //         // Use JUnit or TestNG for running tests
        //         sh 'mvn test'
        //     }
        // }
        stage('Code Analysis') {
            steps {
                // Use Eslint for code analysis
                sh 'npx eslint .'
            }
        }
        stage('Security Scan') {
            steps {
                // Use npm audit for security scanning
                sh 'npm audit'
            }
        }

        stage('Deploy to Staging') {
            steps {
                // use heroku to stage
                sh '''
                heroku login $HEROKU_API_KEY
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
                heroku login $HEROKU_API_KEY
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