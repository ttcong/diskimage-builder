#!/bin/bash
source /home/congtt/Documents/2.Openstack/diskimage-builder/bin/activate
export RELEASE="xenial"
export GUEST_USERNAME="trove"
export DIB_RELEASE="xenial"
export SERVICE_TYPE="mariadb"
export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive"
export TROVESTACK_SCRIPTS="/home/congtt/Documents/2.Openstack/trove-integration/integration/scripts"
export PATH_DISKIMAGEBUILDER="/home/congtt/Documents/2.Openstack/diskimage-builder/diskimage_builder"
export HOST_USERNAME="root"
export DISTRO="ubuntu"
export DISTRO_NAME="ubuntu"
export TROVE_SOURCE="/home/congtt/Documents/2.Openstack/trove"
export ELEMENTS_PATH=$TROVESTACK_SCRIPTS/files/elements:$PATH_DISKIMAGEBUILDER/elements

cp -f /home/congtt/Documents/2.Openstack/trove/trove/guestagent/common/sql_query.py_mysql56 /home/congtt/Documents/2.Openstack/trove/trove/guestagent/common/sql_query.py
cp -f /home/congtt/Documents/2.Openstack/trove/trove/guestagent/strategies/restore/mysql_impl.py_mysql56 /home/congtt/Documents/2.Openstack/trove/trove/guestagent/strategies/restore/mysql_impl.py

disk-image-create -t raw -a amd64 -o ubuntu-amd64-xenial-mariadb-101-prod-test --qemu-img-options compat=1.1 vm ubuntu cloud-init-datasources ubuntu-guest ubuntu-xenial-mariadb  &&

scp ubuntu-amd64-xenial-mariadb-101-prod-test.raw congtt2@10.50.73.10:/home/congtt2/diskimage-builder
