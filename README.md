# ksvalidator
validate kickstart in depending S.O type

Accept version rhel 8, 9 and 10

create a container for validate your ks


Dependencies:

  collections:
    - community.docker

Ansible minimal version: 2.12

Use playbook:

ansible-playbook -c local ks_validator.yml -e @vars/inputs_vars.yml --check

when inputs_vars.yml is on you decide os_version and kickstart_file

When [CONTAINER] Create container for Kickstart validation" to create in Local mode, use this options:
    privileged: true
    network_mode: host
