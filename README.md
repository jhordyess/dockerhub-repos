# My docker hub images

Welcome to my collection of Docker images tailored for [Visual Studio Code Development Containers](https://code.visualstudio.com/docs/devcontainers/containers). These images are equipped with essential tools like **Zsh**, **Git**, and a non-root user named `jhordyess`.

Whether you're a seasoned developer or just starting with Dev Containers, these images aim to simplify your workflow.

## Description

Each image includes the following components:

- [Zsh](https://www.zsh.org/): A powerful and user-friendly shell.
- [Oh My Zsh](https://ohmyz.sh/): A delightful community-driven framework for managing Zsh configurations.
- [Git](https://git-scm.com/): An industry-standard version control system.
- Non-root User: The images come with a non-root user named `jhordyess` to enhance security and manage permissions effectively.

You can find all these images conveniently hosted on [Docker Hub](https://hub.docker.com/).

## Images

Here's a quick reference to the available images:

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

## To-Do

- Add examples using `devcontainer.json` files.
- Translate README.
- Add more to-do's 😏.

## Contribution

If you would like to contribute to the project, open an issue or make a pull request on the repository.

## License

© 2022> [Jhordyess](https://github.com/jhordyess). Under the [MIT](https://choosealicense.com/licenses/mit/) license. See the [LICENSE](./LICENSE) file for more details.

---

Made with 💪 by [Jhordyess](https://www.jhordyess.com/)
