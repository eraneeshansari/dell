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
		  sh "chmod +x changetag.sh"
		  sh "./changetag.sh ${BUILD_ID}"
		  sshagent(['sshk8s']){
		    sh "scp -o StrictHostKeyChecking=no mydep.yaml ec2-user@172.31.3.1:/home/ec2-user/"
			script{
			    try{
				  sh "ssh ec2-user@172.31.3.1 kubectl apply -f ."				 
				}
				catch(error){
				  sh "ssh ec2-user@172.31.3.1 kubectl create -f ."
				}
			}
			
		  }
		} 
         


}


  }




}
