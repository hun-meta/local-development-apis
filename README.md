# local-development-apis

## Description
> 리팩토링 중인 KP-Medicals 프로젝트들을 도커 이미지를 사용해 전부 로컬에서 실행해 테스트 환경을 만드는 프로젝트입니다.
> 
> This is a project to create a test environment by running all the KP-Medicals projects that are currently being refactored locally using Docker images.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Env Settings](#env-settings)
- [Contact](#contact)

## Installation
프로젝트 설치 및 설정 방법입니다.

Instructions on how to install and set up the project. Include any prerequisites.

```bash
# Clone the repository
git clone git@github.com:hun-meta/local-development-apis.git

# Navigate into the directory
cd local-development-apis

# clone all api series project(Which is KP-Medicals refactoring projects)
git clone git@github.com:hun-meta/api-<project>.git

# set env
export SERVER_PLATFORM=<your platform>
# ex. export SERVER_PLATFORM=linux/amd64

# SET .env (detail at the bottom)
vi .env

# create data directory for mariadb
cd mariadb && mkdir data

# install Make utility
sudo apt update
sudo apt install build-essential

# docker image build 
make build-dev-all
```

## Usage
Information on how to use the project, including examples and code snippets.

```bash
# run project
make start-dev-all

# stop project
make stop-dev-all

# stop & delete volume of project
make delete-dev-all
```

## Env Settings
- .env
    ```
    # environment variables for docker-compose.yml

    # MariaDB
    MYSQL_ROOT_PASSWORD=<database root user password>
    MYSQL_USER=<database username to create>
    MYSQL_PASSWORD=<database user password>
    MYSQL_DATABASE=<database schema to create>
    ```

## Contact
Information on how to contact the project maintainers or contributors.

- **Name**: Hun
- **Email**: hun.kim.dev@gmail.com
- **GitHub**: [hun-meta](https://github.com/hun-meta)