pipeline{
   agent any;
   stages{
       stage("Build Docker Image"){
          steps{
           sh "docker build . -t 966145/mydellapp:${BUILD_ID}"
          }
       }
       stage("Push Image to docker hub"){
         steps{
          withCredentials([string(credentialsId: 'dpass', variable: 'pass')]) {
             sh "docker login -u 966145 -p ${pass}"
             sh "docker push 966145/mydellapp:${BUILD_ID}" 
           }
         }
       }

      stage("Deploy to K8s"){
        steps{
          sshagent(['sshk8s']) {
             sh "sudo su -"
             sh "kubectl create -f depl.yaml"
          } 
         
        }

     }




  }




}
