# My docker hub images

Basic docker images for VS Code Dev Containers with Zsh and Git.

## Description

These images are designed to facilitate the development of applications with [Visual Studio Code Development Containers](https://code.visualstudio.com/docs/devcontainers/containers). They include [Zsh](https://www.zsh.org/) (with [Oh My Zsh](https://ohmyz.sh/)), [Git](https://git-scm.com/), and one non-root user called `jhordyess` 🤔.

All images are also published on [Docker Hub](https://hub.docker.com/).

Image | Version* | Docker Hub | Build script | Official image | Comments
-|-|-|-|-|-
 Ubuntu | 22.04 | [jhordyess/ubuntu](https://hub.docker.com/r/jhordyess/ubuntu) | [Dockerfile](./ubuntu/Dockerfile) | [Ubuntu](https://hub.docker.com/_/ubuntu/)
 NodeJS | 16 | [jhordyess/node](https://hub.docker.com/r/jhordyess/node) | [Dockerfile](./node/16/Dockerfile) | [Node](https://hub.docker.com/_/node)
 Tex Live | 2022 | [jhordyess/texlive](https://hub.docker.com/r/jhordyess/texlive) | [Dockerfile](./texlive/small/2022/Dockerfile) | [Tex Live](https://hub.docker.com/r/texlive/texlive) | Using the small tag
 PlatformIO | 6.1 | [jhordyess/platformio](https://hub.docker.com/r/jhordyess/platformio) | [Dockerfile](./platformio/6.1/Dockerfile) | | Using [Python image](https://hub.docker.com/_/python)
 Lenguaje latino | 1.4 | [jhordyess/latino](https://hub.docker.com/r/jhordyess/latino) | [Dockerfile](./latino/1.4/Dockerfile) | | Using [Ubuntu image](https://hub.docker.com/_/ubuntu/)

### Notes

- All versions refers at commit time, except NodeJS that use 16 version.
- PlatformIO and Lenguaje latino use their correspondents installation scripts.
- NodeJS uses `node` as the one non-root user.

## To-Do

- Add examples or uses cases for usage with `devcontainer.json`.
- NodeJS replace `node` user for `jhordyess` 🤔.
- Delete `update` `clean` aliases for zsh.
- Delete unnecessary locale and timezone statements.
- Add more to-do's 😏.

## Contribution

If you would like to contribute to the project, open an issue or make a pull request on the repository.

## License

© 2022> [Jhordyess](https://github.com/jhordyess). Under the [MIT](https://choosealicense.com/licenses/mit/) license. See the LICENSE file for more details.

---

Made with 💪 by [Jhordyess](https://www.jhordyess.com/)
