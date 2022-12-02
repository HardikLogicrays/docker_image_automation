pipeline {
    agent any

    stages {
        stage("git pull"){
            steps{
                script{
                    checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/HardikLogicrays/docker_image_automation']]])
                }
                echo "Pulling project successfully..."
            }
        }
        stage("Build image"){
            steps{
                script{
                    sh 'docker build -t hardiklogicrays/docker_image_automation .'
                    echo 'Image build successfully...'
                }
                
            }
        }
        stage("Push image"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'docker_hub_password', variable: 'docker_hub_password')]) {
                   sh 'docker login -u hardiklogicrays -p ${docker_hub_password}'
}
                   echo 'Docker login successfully...'
                   
                   sh 'docker push hardiklogicrays/docker_image_automation'
                   echo 'Docker image push successfully...'
                }
            }
        }
    }
}
