/**
 * Jenkins Plugins required who are not installed with the suggested plugins:
 * - Pipeline Utility Steps (pipeline-utility-steps) Plugin
 * - Docker Pipeline (docker-workflow) Plugin
 */
pipeline {
  agent any

  environment {
    REPOSITORIES_JSON = '[{"name": "java", "version": "21-3"}, {"name": "texlive", "version": "2025-small"}, {"name": "ubuntu", "version": "24.04"}]'
  }

  stages {
    stage('Build and Push Docker Images') {
      steps {
        script {
          def repositories = readJSON text: env.REPOSITORIES_JSON

          withCredentials([usernamePassword(credentialsId: 'docker-login',
            passwordVariable: 'DOCKER_PASSWORD',
            usernameVariable: 'DOCKER_USERNAME')]) {
            
            try {
              sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
              
              repositories.each { repo ->
                def name = repo.name
                def version = repo.version
                def path = "${name}/${version}"
                def prefix = "${DOCKER_USERNAME}/${name}"
                def tag = "${prefix}:${version}"
                def latestTag = "${prefix}:latest"

                echo "Building Docker image for '${path}'..."
                sh "docker build -t ${tag} --pull --no-cache ./${path}"

                echo "Tagging Docker image with '${latestTag}'..."
                sh "docker tag ${tag} ${latestTag}"

                echo "Pushing Docker image as '${tag}'..."
                sh "docker push ${tag}"

                echo "Pushing Docker image as '${latestTag}'..."
                sh "docker push ${latestTag}"
              }
            } finally {
              sh "docker logout"
            }
          }
        }
      }
    }
  }

  post {
    always {
      script {
        sh "docker system prune -f"
      }
    }
    success {
      echo "All Docker images were built and pushed successfully."
    }
    failure {
      echo "Failed to build or push Docker images."
    }
  }
}