#!/bin/bash

echo "Removing roles"

for i in `ls /etc/ansible/roles`; do
	ansible-galaxy remove $i;
done

ansible-galaxy install -r provisioning/ansible/requirements.yml

