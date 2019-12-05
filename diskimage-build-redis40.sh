#!/bin/bash
source /home/congtt/Documents/2.Openstack/diskimage-builder/bin/activate
export RELEASE="xenial"
export GUEST_USERNAME="trove"
export DIB_RELEASE="xenial"
export SERVICE_TYPE="redis"
export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive"
export TROVESTACK_SCRIPTS="/home/congtt/Documents/2.Openstack/trove-integration/integration/scripts"
export PATH_DISKIMAGEBUILDER="/home/congtt/Documents/2.Openstack/diskimage-builder/diskimage_builder"
export HOST_USERNAME="root"
export DISTRO="ubuntu"
export DISTRO_NAME="ubuntu"
export TROVE_SOURCE="/home/congtt/Documents/2.Openstack/trove"
export ELEMENTS_PATH=$TROVESTACK_SCRIPTS/files/elements:$PATH_DISKIMAGEBUILDER/elements
export REDIS_VERSION="4.0.14"

disk-image-create -t raw -a amd64 -o ubuntu-amd64-xenial-redis-$REDIS_VERSION-test --qemu-img-options compat=1.1 vm ubuntu cloud-init-datasources ubuntu-guest ubuntu-xenial-redis &&

scp ubuntu-amd64-xenial-redis-$REDIS_VERSION-test.raw congtt2@10.50.73.10:/home/congtt2/diskimage-builder
