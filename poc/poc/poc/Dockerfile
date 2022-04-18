FROM alpine:3.15.4

RUN \
 apk add \
   curl \
   python3 \
   py-pip \
   py-boto \
   py-dateutil \
   py-httplib2 \
   py3-jinja2 \
   py-paramiko \
   py-setuptools \
   py-yaml \
   openssh-client \
   bash \
   tar && \
 pip install --upgrade pip

RUN ln -s /usr/bin/python3 /usr/bin/python

# Makes the Ansible directories
RUN mkdir /etc/ansible /ansible
RUN mkdir ~/.ssh

# Over rides SSH Hosts Checking
RUN echo "host *" >> ~/.ssh/config &&\
    echo "StrictHostKeyChecking no" >> ~/.ssh/config

# Downloads the Ansible tar (curl) and saves it (-o)
RUN \
  curl -fsSL https://releases.ansible.com/ansible/ansible-2.9.3.tar.gz -o ansible.tar.gz
# Extracts Ansible from the tar file
RUN \
  tar -xzf ansible.tar.gz -C ansible --strip-components 1 && \
  rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

# Makes a directory for ansible playbooks
RUN mkdir -p /ansible/playbooks

# Makes the playbooks directory the working directory
WORKDIR /ansible/playbooks

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib

COPY ./inventory.ini /ansible/playbooks/inventory.ini
COPY ./ansible.cfg /etc/ansible/ansible.cfg
COPY ./playbook2.yml /ansible/playbooks/playbook2.yml
RUN chmod -R 777 /ansible/playbooks/
COPY ./access.pem /ansible/playbooks/access.pem
COPY ./run.sh /ansible/playbooks/run.sh
RUN chmod -R 777 /ansible/playbooks/run.sh

#Sample entry point
#ENTRYPOINT ["ansible-playbook"]


