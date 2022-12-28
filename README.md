# NAOqi Python development environment with Docker

[NAOqi Python SDK](http://doc.aldebaran.com/2-5/dev/python/intro_python.html) running in a Docker container. The directory `./src` is mapped in the container and real-time updated, so you can develop your code on your host machine and run it from the Docker container.

## Prerequisites

- [Docker](https://www.docker.com)

## Installation

1. Clone this repo and move into the directory.
2. Download the [Python SDK for Linux](https://www.aldebaran.com/en/support/nao-6/downloads-softwares) and put it in the root of the folder with the cloned repository. The filename should be `pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327.tar.gz`.
3. Build the container `docker build -t naoqi-python .`
4. Run the container ``docker run -v `pwd`/src:/naoqi/src -it naoqi-python bash``. This will open a bash prompt from which you can execute your code from the `./src` directory.

References: https://github.com/remcorakers/naoqi-docker
