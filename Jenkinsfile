pipeline {
  agent any
  stages {
    stage('Git pull') {
      steps {
        git url: 'https://github.com/sriram-R-krishnan/devops-build.git'branch: 'main'
      }
    }
    stage('Build Docker Image') {
      when {
        branch 'dev'
      }
      steps {
        sh './build.sh'
      }
    }
    stage('Push to Docker Hub (Dev)') {
      when {
        branch 'dev'
      }
      steps {
        sh 'docker tag  f957eed04e44 nareshk321/latest'
        sh 'docker push nareshk321/dev:latest'
      }
    }
    stage('Deploy') {
      steps {
        sh './deploy.sh'
      }
    }
    stage('Push to Docker Hub (Prod)') {
      when {
        branch 'main'
      }
      steps {
        sh 'docker tag  f957eed04e44 nareshk321/prod:latest'
        sh 'docker push nareshk321/prod:latest'
      }
    }
  }
}