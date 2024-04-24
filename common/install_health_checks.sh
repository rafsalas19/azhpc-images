#!/bin/bash


set -e

AZHC_VERSION=v0.4.2

DEST_TEST_DIR=/opt/azurehpc/test

mkdir -p $DEST_TEST_DIR

pushd $DEST_TEST_DIR

git clone https://github.com/Azure/azurehpc-health-checks.git --branch $AZHC_VERSION

pushd azurehpc-health-checks

# Pull down docker container from MCR
./dockerfile/pull-image-acr.sh cuda

popd
popd

$COMMON_DIR/write_component_version.sh "AZ_HEALTH_CHECKS" ${AZHC_VERSION}
