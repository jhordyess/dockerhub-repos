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

## Usage

To use these images, you must have [Docker](https://www.docker.com/) installed on your computer. Then, you can use the following command to download the image:

```bash
docker pull jhordyess/<image>:<version>
```

For example, to download the Ubuntu 24.04 image, you can use the following command:

```bash
docker pull jhordyess/ubuntu:24.04
```

## Images

Image | Tags | Dockerfile | Info
-|-|-|-
[jhordyess/java](https://hub.docker.com/r/jhordyess/java) | `latest`, `21-3` | [Dockerfile](./java/21-3/Dockerfile) | Based on [Maven](https://hub.docker.com/_/maven/) 3 with Java 21 using the Eclipse Temurin distribution
[jhordyess/texlive](https://hub.docker.com/r/jhordyess/texlive) | `latest`, `2025-small` | [Dockerfile](./texlive/2025-small/Dockerfile) | Based on the latest [Tex Live](https://hub.docker.com/r/texlive/texlive) and using the small tag
[jhordyess/ubuntu](https://hub.docker.com/r/jhordyess/ubuntu) | `latest`, `24.04` | [Dockerfile](./ubuntu/24.04/Dockerfile) | Based on [Ubuntu](https://hub.docker.com/_/ubuntu/) 24.04

## To-Do

- Add examples using `devcontainer.json` files.
- Add more to-do's 😏.

## Contribution

If you would like to contribute to the project, open an issue or make a pull request on the repository.

## License

© 2022-2025 [Jhordyess](https://github.com/jhordyess). Under the [MIT](https://choosealicense.com/licenses/mit/) license. See the [LICENSE](./LICENSE) file for more details.

---

Made with 💪 by [Jhordyess](https://www.jhordyess.com/)
