node{
  stage('SCM Checkout'){
    git 'https://github.com/UttaravK/Jenkins_CICD'
  }
  stage('Compile-Package'){
    sh 'mvn package'
  }
}
