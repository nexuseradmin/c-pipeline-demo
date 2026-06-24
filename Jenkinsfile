pipeline {

    agent any

    environment {
        PACKAGE_NAME = "c_pipeline"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {

                sh '''
                mkdir -p build
                cd build

                cmake ..

                make
                '''

            }
        }

        stage('Unit Test') {

            steps {

                sh '''
                chmod +x tests/test.sh
                ./tests/test.sh
                '''

            }

        }

        stage('Package') {

            steps {

                sh '''
                mkdir -p release

                cp build/c_pipeline release/

                tar -czvf ${PACKAGE_NAME}-${BUILD_NUMBER}.tar.gz release
                '''

            }

        }

        stage('Archive') {

            steps {

                archiveArtifacts artifacts: '*.tar.gz'

            }

        }

    }

    post {

        success {

            mail to: 'yourmail@gmail.com',
                 subject: "SUCCESS : ${JOB_NAME} #${BUILD_NUMBER}",
                 body: """
Pipeline Completed Successfully

Project : ${JOB_NAME}

Build Number : ${BUILD_NUMBER}

Status : SUCCESS

Tag : ${TAG_NAME}
"""

        }

        failure {

            mail to: 'yourmail@gmail.com',
                 subject: "FAILED : ${JOB_NAME} #${BUILD_NUMBER}",
                 body: """
Pipeline Failed

Project : ${JOB_NAME}

Build Number : ${BUILD_NUMBER}

Status : FAILED
"""

        }

    }

}
