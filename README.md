# UWEA Devcontainer

This is a base devcontainer toolbox for setting up development environment for apps based on PHP and Node.

## Requirements

- Docker
- Docker Compose
- VS Code or another editor capable of working with `.devcontainer.json` config

## Setup

- Clone this repository
- Copy `.env.local` to `.env` and fill the SSH key paths
  - Note: the setup will map the key paths to internal `.ssh` directory in the containers so you can use GIT with your SSH keys from the devcontainer. Mappings are configured in `docker-compose.yml`
  - ```
    cp .env.local .env
    ```

- Open either of the `devcontainer-*` directories so that your IDE/Editor picks up the `.devcontainer.json`
  - Continue in your editor to start the containers
- Open a terminal within the devcontainer
- Run the init command
  - ```
    make init
    ```
- Go to the `projects` subdirectory and start developing!
