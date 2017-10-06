#!/bin/bash

# Folder to download roles into. Make sure it has the right permissions for the
# user runnig this script
export ANSIBLE_ROLES_PATH=~/.ansible/roles

# Create $ANSIBLE_ROLES_PATH if it does not exist
if [ ! -d "$ANSIBLE_ROLES_PATH" ]; then
  mkdir $ANSIBLE_ROLES_PATH
fi

echo "Removing roles"

for i in `ls $ANSIBLE_ROLES_PATH`; do
	ansible-galaxy remove $i;
done

ansible-galaxy -c install --roles-path $ANSIBLE_ROLES_PATH -r requirements.yml

