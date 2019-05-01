node{
  stage('SCM Checkout'){
    git 'https://github.com/UttaravK/Jenkins_CICD'
  }
  stage('Compile-Package'){
    sh 'mvn package'
  }
  stage('Docker-login'){
   sh 'docker login --username=ukulkarni --password=Uttara@123'
  }
  stage('Docker-create-img'){
   sh 'cp ./target/gs-serving-web-content-0.1.0.jar .'
   sh 'mv gs-serving-web-content-0.1.0.jar WebApp.jar'
   sh 'docker build -t latest .'
   sh 'docker push ukulkarni/webapp-repo'
  }
  stage('Start-Minikube')
  {
   sh 'minikube start'
  }
  stage('Clean-up-kubernetes')
  {
   sh 'kubectl delete daemonsets,replicasets,services,deployments,pods,rc --all'
  }
  stage('create-deployment')
  {
   sh 'kubectl apply -f deployment.yml '
  }
}
