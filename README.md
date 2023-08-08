# My docker hub images

Basic docker images for VS Code Dev Containers with Zsh and Git.

## Description

These images are designed to facilitate the development of applications with [Visual Studio Code Development Containers](https://code.visualstudio.com/docs/devcontainers/containers). They include [Zsh](https://www.zsh.org/) (with [Oh My Zsh](https://ohmyz.sh/)), [Git](https://git-scm.com/), and one non-root user called `jhordyess` 🤔.

All images are also published on [Docker Hub](https://hub.docker.com/).

Image | Version* | Docker Hub | Build script | Official image | Comments
-|-|-|-|-|-
 Ubuntu | 22.04 | [jhordyess/ubuntu](https://hub.docker.com/r/jhordyess/ubuntu) | [Dockerfile](./ubuntu/Dockerfile) | [Ubuntu](https://hub.docker.com/_/ubuntu/)
 NodeJS | 18 | [jhordyess/node](https://hub.docker.com/r/jhordyess/node) | [Dockerfile](./node/Dockerfile) | [Node](https://hub.docker.com/_/node)
 Java & Maven | 17 & 3| [jhordyess/java](https://hub.docker.com/r/jhordyess/latino) | [Dockerfile](./java/Dockerfile) | [Maven](https://hub.docker.com/_/maven/) | Using the Eclipse Temurin  distribution
 Tex Live | 2023 | [jhordyess/texlive](https://hub.docker.com/r/jhordyess/texlive) | [Dockerfile](./texlive/small/Dockerfile) | [Tex Live](https://hub.docker.com/r/texlive/texlive) | Using the small tag
 PlatformIO | 6.1 | [jhordyess/platformio](https://hub.docker.com/r/jhordyess/platformio) | [Dockerfile](./platformio/Dockerfile) | | Using the [Python image](https://hub.docker.com/_/python)
 Lenguaje latino | 1.4 | [jhordyess/latino](https://hub.docker.com/r/jhordyess/latino) | [Dockerfile](./latino/Dockerfile) | | Using the [Ubuntu image](https://hub.docker.com/_/ubuntu/)

### Notes

- All versions refers at commit time, except NodeJS that use 18 version.
- PlatformIO and Lenguaje latino use their correspondents installation scripts.
- NodeJS uses `node` as the one non-root user.

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
