pipeline {
  agent any

  environment {
    GIT_REPO = 'https://github.com/ahmadfarooqtech/my-portfolio.git'
    BRANCH = 'gh-pages'
ID
  }

  stages {
    stage('Checkout gh-pages') {
      steps {
        git branch: "${BRANCH}",
            credentialsId: "${GIT_CREDENTIALS_ID}",
            url: "${GIT_REPO}"
      }
    }

    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }

    stage('Deploy to gh-pages') {
      steps {
        sh '''
          cp -r build/* .
          git config user.email "ci@jenkins.com"
          git config user.name "Jenkins CI"
          git add .
          git commit -m "Deploy from Jenkins"
          git push origin gh-pages
        '''
      }
    }
  }

  post {
    failure {
      echo "Deployment failed"
    }
    success {
      echo "Deployment successful to gh-pages"
    }
  }
}
