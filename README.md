# ksvalidator
validate kickstart in depending S.O type

Accept version rhel 8, 9 and 10

create a container for validate your ks

Use playbook:

ansible-playbook main.yml --extra-vars -e @input_vars.yml

when input_vars.yml is on you decide os_version and kickstart_file
