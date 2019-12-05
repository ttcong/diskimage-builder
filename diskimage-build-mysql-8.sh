#!/bin/bash
source /home/congtt/Documents/2.Openstack/diskimage-builder/bin/activate
export RELEASE="xenial"
export GUEST_USERNAME="trove"
export DIB_RELEASE="xenial"
export SERVICE_TYPE="mysql"
export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive"
export TROVESTACK_SCRIPTS="/home/congtt/Documents/2.Openstack/trove-integration/integration/scripts"
export PATH_DISKIMAGEBUILDER="/home/congtt/Documents/2.Openstack/diskimage-builder/diskimage_builder"
export HOST_USERNAME="root"
export BRANCH_OVERRIDE="stable/queens"
export DISTRO="ubuntu"
export DISTRO_NAME="ubuntu"
export TROVE_SOURCE="/home/congtt/Documents/2.Openstack/trove"
export ELEMENTS_PATH=$TROVESTACK_SCRIPTS/files/elements:$PATH_DISKIMAGEBUILDER/elements
export MYSQL_VERSION="mysql-8.0"

cp -f /home/congtt/Documents/2.Openstack/trove/trove/guestagent/common/sql_query.py_mysql57 /home/congtt/Documents/2.Openstack/trove/trove/guestagent/common/sql_query.py
cp -f /home/congtt/Documents/2.Openstack/trove/trove/guestagent/strategies/restore/mysql_impl.py_mysql57 /home/congtt/Documents/2.Openstack/trove/trove/guestagent/strategies/restore/mysql_impl.py

disk-image-create -t raw -a amd64 -o ubuntu-amd64-xenial-mysql-8-prod-test --qemu-img-options compat=1.1 vm ubuntu cloud-init-datasources ubuntu-guest ubuntu-xenial-mysql  &&

scp ubuntu-amd64-xenial-mysql-8-prod-test.raw congtt2@10.50.73.10:/home/congtt2/diskimage-builder
