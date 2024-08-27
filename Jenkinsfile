pipeline {
    agent any 
    
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the Code"
                git url:"https://github.com/devopsditinus/project_1.git", branch: "main"
            }
        }
        stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build . -t project_1"

            }
        }
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to Docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHUB",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag project_1 ${env.dockerHubUser}/project_1:test1"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/project_1:test1"
                }
            }
        }  
         
    }
    
    post {
                always{
                  emailext (
                      subject: "Pipeline Status: ${BUILD_NUMBER}", 
                      body: ''' <html> 
                      		<body>
					<p>Build Status: ${BUILD_STATUS}</p>
					<p>Build Number: ${BUILD_NUMBER}</p>
					<p>Check the <a href="${BUILD_URL}">console output</a>.</p> 
				</body>
			    </html>''',
                      to: 'devinder@ditinustechnology.com',
                      from: 'ditinustechnology3@gmail.com',
                      replyTo: 'ditinustechnology3@gmail.com',
                      mimeType: 'text/html'
                      
              )
              
              }
          }
    
}
