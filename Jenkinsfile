node('slave-node') {
    checkout scm
    stage ('Building Image')
    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_credentials') {
        def customImage = docker.build("hardiklogicrays/docker_image_automation:latest")

        customImage.push()
    }

    stage ('Deploy') {
        sh '''docker run --name devops hardiklogicrays/docker_image_automation:latest'''
    }
}