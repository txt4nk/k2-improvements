#!/bin/ash

set -xe

SCRIPT_DIR=$(readlink -f $(dirname ${0}))

install_feature() {
    FEATURE=${1}
    if [ ! -f /tmp/${FEATURE} ]; then
        ${SCRIPT_DIR}/features/${FEATURE}/install.sh
        touch /tmp/${FEATURE}
    fi
}

install_feature moonraker
install_feature fluidd
install_feature screws_tilt_adjust
mkdir -p /tmp/macros
install_feature macros/bed_mesh
install_feature macros/m191
install_feature macros/start_print
