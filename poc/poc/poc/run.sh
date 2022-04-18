#!/bin/bash
/ansible/bin/ansible-playbook "/ansible/playbooks/playbook2.yml" -i "/ansible/playbooks/inventory.ini" -e "targethosts=linux" -e "ansible_ssh_user=ec2-user"
