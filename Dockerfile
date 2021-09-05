FROM ubuntu:20.04
ENV WORKDIR=/ansible
ENV ANSIBLE_VERSION=ansible==2.10
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python3-pip && rm -rf /var/lib/apt/lists/*
RUN pip3 install ${ANSIBLE_VERSION}  boto==2.49.0 boto3==1.11.0 linode-cli
RUN ansible-galaxy collection install community.aws:1.5.0 && \
ansible-galaxy collection install amazon.aws:1.5.0 && \
ansible-galaxy collection install community.general:2.5.1

COPY . ${WORKDIR}
WORKDIR ${WORKDIR}

RUN ansible-playbook -v playbook.yml

ENV PATH=/usr/bin:/bin:$PATH
ENTRYPOINT ["ansible-playbook", "-v"]
