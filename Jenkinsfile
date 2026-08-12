pipeline {
    agent { 
        label 'ROBOSHOP' 
    }
    environment { 
        def appVersion= ""
        acc_id = "578257748163"
        component = "catalogue"
        project = "roboshop"
        SCANNER_HOME = "sonar-8"
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
        stage('SonarQube Analysis') {
            steps {
                // 'MySonarServer' must match the installation name in Jenkins System Configuration
                withSonarQubeEnv('MySonarServer') {
                    script {
                        sh """
                            ${SCANNER_HOME}/bin/sonar-scanner \
                            -Dsonar.projectKey=my-app-key \
                            -Dsonar.sources=src \
                            -Dsonar.java.binaries=target/classes
                        """
                    }
                }
            }
        }

        stage('Docker Build and Push') {
            steps {
                // The plugin sets up the environment variables automatically
                withAWS(credentials: 'aws-id', region: 'us-east-1') {
                    script {
                        sh """
                            aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${acc_id}.dkr.ecr.us-east-1.amazonaws.com
                            docker build -t ${acc_id}.dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${appVersion} .
                            docker push ${acc_id}.dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${appVersion}
                        """
                    }
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
    
