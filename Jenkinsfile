pipeline {
    agent { 
        label 'ROBOSHOP' 
    }
    environment { 
        def appVersion= ""
    }
    options {
        disableConcurrentBuilds()
        timeout(time: 15, unit: 'MINUTES') 
    }
    // parameters {
    //     string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    //     text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
    //     booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
    //     choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
    //     password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    // }

    stages {
        stage('Read package.json') {
            steps {
                script {
                    // Read and parse the file
                    def packageJson = readJSON file: 'package.json'
                    
                    // Access top-level keys directly using dot notation
                    appVersion = packageJson.version
                    echo "Version: ${appVersion}"
                }
            }
        }
        stage('npm install') {
            steps {
                echo 'npm install..'
                script {
                sh """
                    npm install
                """
            }
        }
        }

        stage("docker build") {
            steps {
                echo 'docker build..'
                script {
                sh """
                    docker build -t catalogue:${appVersion} .
                """
            }
        }
        }

        stage("docker push") {
            steps {
                echo 'docker push..'
                script {
                sh """
                    docker push catalogue:${appVersion}
                """
            }
        }
        }
        stage('pre-build') {
            steps {
                echo 'Pre-build..'
                script {
                sh '''
                    echo 'Pre-build.. din-sri'
                '''
            }
        }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                script {
                sh """
                    echo 'Building.. catalogue'
                    
                """
            }

        }
        }

        stage('Test') {
            steps {
                echo 'Testing..'
                sh '''
                    echo 'Testing.. din-str'
                '''
            }
        }

        stage('Deploy') {
        /*
            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                }
            }*/
            steps {
                echo 'Deploying....'
                sh '''
                    echo 'Deploying.... din-sri'
                '''
            }
        }
        
    }
        post { 
        always { 
            echo 'I will always say Hello again!'
        }
        success { 
            echo 'I will say Hello only if successful'
        }
        failure { 
            echo 'I will say Bye only if failure'
        }
    }
}
    
