node{
  stage('SCM Checkout'){
    git 'https://github.com/UttaravK/Jenkins_CICD'
  }
  stage('Compile-Package'){
    sh 'mvn package'
  }
  stage('Clean-up-app'){
    sh '
	if pgrep -x gs-serving-web-content-0.1.0.jar > /dev/null
	then
	   ps | grep gs-serving-web-content-0.1.0.jar | awk {'print $1'} | head -n 1 | xargs kill -6
        fi
       '
       }
  stage('Docker-login'){
   sh 'docker login --username=ukulkarni --password=Uttara@123'
  }
  stage('Docker-create-img'){
   sh 'cp ./target/gs-serving-web-content-0.1.0.jar .'
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
