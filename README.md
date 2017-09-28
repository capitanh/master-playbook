# Ansible Master Playbook

This is a generic ansible master playbook used to develop more complex playbooks. It contains no code, just configuration and makes use of ansible-galaxy externalized roles feature. Roles are declared in ```provisioning/ansible/requirements.yml```, and the ```updateroles.sh``` provided shell script takes care of delete and donwload every role declared. All variables are global, defined in ```provisioning/ansible/group_vars/all```. For an easy development and quick test,a Vagrantfile is provided, bringing up a CentOS 7 VM and running a full provision, executing ansible-playbook against ```site.yml```.