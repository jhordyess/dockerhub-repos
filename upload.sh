#!/bin/bash

read -p "Input  your username: " username

repositories=(
  "java,17-3"
  "latino,1.4"
  "node,18"
  "platformio,6.1"
  "texlive,2024-small"
  "ubuntu,22.04"
)

for repo in "${repositories[@]}"; do
  name="${repo%%,*}"
  version="${repo#*,}"

  path="${name}/${version}"
  prefix="${username}/${name}"
  tag="${prefix}:${version}"
  latestTag="${prefix}:latest"

  echo "Building Docker image for '$path'..."
  docker build -t "$tag" "./$path"

  echo "Tagging Docker image with '$latestTag'..."
  docker tag "$tag" "$latestTag"
done

echo "Docker images built successfully."

read -p "Do you want to push the images to Docker Hub? (y/n) " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then
  echo "Logging in to Docker Hub..."
  docker login -u "$username"

  for repo in "${repositories[@]}"; do
    name="${repo%%,*}"
    version="${repo#*,}"

    path="${name}/${version}"
    prefix="${username}/${name}"
    tag="${prefix}:${version}"
    latestTag="${prefix}:latest"

    echo "Pushing Docker image for '$path' as '$tag'..."
    docker push "$tag"

    echo "Pushing Docker image for '$path' as '$latestTag'..."
    docker push "$latestTag"
  done

  echo "Docker images pushed successfully."

  echo "Logging out of Docker Hub..."
  docker logout
else
  echo "Docker images were not pushed to Docker Hub."
fi
