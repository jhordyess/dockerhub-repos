pipeline {
  agent any

  environment {
    REPOSITORIES_JSON = '[{"name": "java", "version": "21-3"}, {"name": "texlive", "version": "2025-small"}, {"name": "ubuntu", "version": "24.04"}]',
    DOCKER_PREFIX = credentials('docker-prefix')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build Docker Images') {
      steps {
        script {
          def repositories = readJSON text: env.REPOSITORIES_JSON
          repositories.each { repo ->
            def name = repo.name
            def version = repo.version
            def path = "${name}/${version}"
            def prefix = "${env.DOCKER_PREFIX}/${name}"
            def tag = "${prefix}:${version}"
            def latestTag = "${prefix}:latest"

            stage("Build & Tag Docker Image for ${path}") {
              echo "Building..."
              sh "docker build -t ${tag} ./${path}"

              echo "Tagging with ${latestTag}..."
              sh "docker tag ${tag} ${latestTag}"
            }
          }
        }
      }
    }

    stage('Push Docker Images') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: 'docker-hub-username', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
            echo "Logging in to Docker Hub..."
            sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
          }

          def repositories = readJSON text: env.REPOSITORIES_JSON
          repositories.each { repo ->
            def name = repo.name
            def version = repo.version
            def path = "${name}/${version}"
            def prefix = "${env.DOCKER_PREFIX}/${name}"
            def tag = "${prefix}:${version}"
            def latestTag = "${prefix}:latest"

            stage("Push Docker Image for ${path}") {
              echo "Pushing as ${tag}..."
              sh "docker push ${tag}"

              echo "Pushing as ${latestTag}..."
              sh "docker push ${latestTag}"
            }
          }

          echo "Docker images pushed successfully."

          echo "Logging out of Docker Hub..."
          sh "docker logout"
        }
      }
    }
  }
}
