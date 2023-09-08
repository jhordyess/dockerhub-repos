# My docker hub images

Basic docker images for VS Code Dev Containers with Zsh and Git.

## Description

These images are designed to facilitate the development of applications with [Visual Studio Code Development Containers](https://code.visualstudio.com/docs/devcontainers/containers). They include [Zsh](https://www.zsh.org/) (with [Oh My Zsh](https://ohmyz.sh/)), [Git](https://git-scm.com/), and one non-root user called `jhordyess` 🤔.

All images are also published on my [Docker Hub Profile](https://hub.docker.com/r/jhordyess).

## Usage

To use these images, you must have [Docker](https://www.docker.com/) installed on your computer. Then, you can use the following command to download the image:

```bash
docker pull jhordyess/<image>:<version>
```

For example, to download the Ubuntu 22.04 image, you can use the following command:

```bash
docker pull jhordyess/ubuntu:22.04
```

## Images

Image | Tags | Dockerfile | Info
-|-|-|-
[jhordyess/java](https://hub.docker.com/r/jhordyess/java) | `latest`, `17-3` | [Dockerfile](./java/17-3/Dockerfile) | Based on [Maven](https://hub.docker.com/_/maven/) 3 with Java 17 using the Eclipse Temurin distribution
[jhordyess/latino](https://hub.docker.com/r/jhordyess/latino) | `latest`, `1.4` | [Dockerfile](./latino/1.4/Dockerfile) | Based on [Ubuntu](https://hub.docker.com/_/ubuntu/) 22.04 and using the Lenguaje latino installation script
[jhordyess/node](https://hub.docker.com/r/jhordyess/node) | `latest`, `18` | [Dockerfile](./node/18/Dockerfile) | Based on [Node](https://hub.docker.com/_/node) 18
[jhordyess/platformio](https://hub.docker.com/r/jhordyess/platformio) | `latest`, `6.1` | [Dockerfile](./platformio/6.1/Dockerfile) | Based on [Python](https://hub.docker.com/_/python) 3 and using the PlatformIO installation script
[jhordyess/texlive](https://hub.docker.com/r/jhordyess/texlive) | `latest`, `2023-small` | [Dockerfile](./texlive/2023-small/Dockerfile) | Based on the latest [Tex Live](https://hub.docker.com/r/texlive/texlive) and using the small tag
[jhordyess/ubuntu](https://hub.docker.com/r/jhordyess/ubuntu) | `latest`, `22.04` | [Dockerfile](./ubuntu/22.04/Dockerfile) | Based on [Ubuntu](https://hub.docker.com/_/ubuntu/) 22.04

## To-Do

- Add examples using `devcontainer.json` files.
- NodeJS, change non-root user `node` to `jhordyess`.
- Add more to-do's 😏.

## Contribution

If you would like to contribute to the project, open an issue or make a pull request on the repository.

## License

© 2022> [Jhordyess](https://github.com/jhordyess). Under the [MIT](https://choosealicense.com/licenses/mit/) license. See the LICENSE file for more details.

---

Made with 💪 by [Jhordyess](https://www.jhordyess.com/)
