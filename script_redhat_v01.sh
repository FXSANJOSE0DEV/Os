#!/bin/bash

# Variables
ISO_PATH=/home/admin-xav/download/CentOS-Stream-9-latest-x86_64-dvd1.iso
KS_CFG=/home/admin-xav/download/ks_fx.cfg
VM_NAME="RedHat9_VM"
DISK_SIZE="30"
RAM="2048"
CPUS="2"

# Création de la machine virtuelle
virt-install \
  --name $VM_NAME \
  --ram $RAM \
  --vcpus $CPUS \
  --disk path=/var/lib/libvirt/images/$VM_NAME.img,size=$DISK_SIZE \
  --os-variant centos-stream9 \
  --network bridge=virbr0 \
  --graphics none \
  --console pty,target_type=serial \
  --location $ISO_PATH \
  --initrd-inject $KS_CFG \
  --extra-args "inst.ks=file:/ks_fx.cfg console=ttyS0,115200n8"


# Note: Ce script est un exemple de base. Vous devrez peut-être l'ajuster en fonction de votre environnement et de vos besoins spécifiques.
