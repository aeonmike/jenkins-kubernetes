pipeline {
    agent any
   
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }

  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
   
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t mikejc30/kube:latest .'
            }
        }
      
      stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
       stage('Push') {
      steps {
        sh 'docker push mikejc30/kube:latest'
      }
    }
        stage('Deploy') {
            steps {
              script {
               withKubeConfig(credentialsId: 'kubeconfig'){
                  sh "kubectl apply -f deployment.yaml -f service.yaml"
                }
              }
            }
        }
    }
}
