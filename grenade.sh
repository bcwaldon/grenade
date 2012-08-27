#!/usr/bin/env bash
set -o xtrace

# ``grenade.sh`` is an OpenStack upgrade test harness to exercise the
# upgrade process from Essex to Folsom.  It uses DevStack to perform
# the initial # Openstack install

# Grenade assumes it is running on the system that will be hosting the upgrade processes

ESSEX_DEST=/opt/stack.essex
ESSEX_DEVSTACK_REPO=http://github.com/openstack-dev/devstack.git
ESSEX_DEVSTACK_BRANCH=stable/essex

FOLSOM_DEST=/opt/stack.folsom
FOLSOM_DEVSTACK_REPO=$ESSEX_DEVSTACK_REPO
FOLSOM_DEVSTACK_BRANCH=master


# Keep track of the grenade directory
GRENADE_DIR=$(cd $(dirname "$0") && pwd)

# Import common functions
source $GRENADE_DIR/functions


# System Preparation
# ==================

mkdir -p $ESSEX_DEST
git_clone $ESSEX_DEVSTACK_REPO $ESSEX_DEST $ESSEX_DEVSTACK_BRANCH

mkdir -p $FOLSOM_DEST
git_clone $FOLSOM_DEVSTACK_REPO $FOLSOM_DEST $FOLSOM_DEVSTACK_BRANCH

# Set up localrc
#cp -p $GRENADE_DIR/devstack.start.localrc $DEVSTACK_START_DIR/localrc

# clean up apache config
# essex devstack uses 000-default
# folsom devstack uses horizon -> ../sites-available/horizon
#if [[ -e /etc/apache2/sites-enabled/horizon ]]; then
    # Clean up folsom-style
#    sudo "a2dissite horizon; service apache2 reload"
#fi
