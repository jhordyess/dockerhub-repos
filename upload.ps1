$username = Read-Host "Input your username"

$repositories = @(
  "java,21-3",
  "texlive,2025-small",
  "ubuntu,24.04"
)

foreach ($repo in $repositories) {
  $name = $repo.Split(',')[0]
  $version = $repo.Split(',')[1]

  $path = "$name/$version"
  $prefix = "$username/$name"
  $tag = "$prefix`:$version"
  $latestTag = "$prefix`:latest"

  Write-Host "Building Docker image for '$path'..."
  docker build -t $tag "./$path"

  Write-Host "Tagging Docker image with '$latestTag'..."
  docker tag $tag $latestTag
}

Write-Host "Docker images built successfully."

$choice = Read-Host "Do you want to push the images to Docker Hub? (y/n)"
if ($choice -eq "y" -or $choice -eq "Y") {
  Write-Host "Logging in to Docker Hub..."
  docker login -u $username

  foreach ($repo in $repositories) {
    $name = $repo.Split(',')[0]
    $version = $repo.Split(',')[1]

    $path = "$name/$version"
    $prefix = "$username/$name"
    $tag = "$prefix`:$version"
    $latestTag = "$prefix`:latest"

    Write-Host "Pushing Docker image for '$path' as '$tag'..."
    docker push $tag

    Write-Host "Pushing Docker image for '$path' as '$latestTag'..."
    docker push $latestTag
  }

  Write-Host "Docker images pushed successfully."

  Write-Host "Logging out of Docker Hub..."
  docker logout
} else {
  Write-Host "Docker images were not pushed to Docker Hub."
}