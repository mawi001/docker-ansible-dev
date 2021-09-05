# What is in the bag

Docker image with batteries included to start Ansible and Terraform development

# Build

```sh
DOCKER_IMAGE=mwillemsma/docker-ansible-dev
docker build -t ${DOCKER_IMAGE} .
```

# Run

```sh
docker run -v $(pwd):/ansible --rm mwillemsma/docker-ansible-dev:latest playbook.yml
```
