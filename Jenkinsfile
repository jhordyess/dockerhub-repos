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
    stage('Login to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
          sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
        }
      }
    }

    stage('Build, Tag, and Push Images') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
          script {
            def repositories = readJSON text: env.REPOSITORIES_JSON
            repositories.each { repo ->
              def name = repo.name
              def version = repo.version
              def path = "${name}/${version}"
              def prefix = "\$DOCKER_USERNAME/${name}"
              def tag = "${prefix}:${version}"
              def latestTag = "${prefix}:latest"

              stage("Build: ${tag}") {
                sh "docker build -t ${tag} --pull --no-cache ./${path}"
              }

              stage("Tag: ${tag} and ${latestTag}") {
                sh "docker tag ${tag} ${latestTag}"
              }

              stage("Push: ${tag}") {
                sh "docker push ${tag}"
              }
              
              stage("Push: ${latestTag}") {
                sh "docker push ${latestTag}"
              }
            }
          }
        }
      }
    }

    stage('Logout from DockerHub') {
      steps {
        sh "docker logout"
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