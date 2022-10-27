#!/bin/bash

#vm caracteristiques
export vm_name="debian-11-perso-tf"
export template_description="VM debian"
export vm_default_user="root"
export vm_cpu=2
export vm_disk="8G"
export vm_memory=4096

# VM root login & deploy user
export prefix_disk="vd"
export ssh_username="root"
export ssh_password="HugePassword"
export userdeploy_password="HugePassword"

export vm_keys=$(echo "$(cat ~/.ssh/id_rsa.pub)")
#export vm_keys=$(echo "$(cat ./KeyDEPLOY.id_rsa.pub)\n$(cat ./KeyINFRA.id_rsa.pub)\n$(cat ~/.ssh/id_rsa.pub)")

# set variables
j2 http/preseed.cfg.j2 > http/preseed.cfg

packer build debian11.json

rm -f http/preseed.cfg


