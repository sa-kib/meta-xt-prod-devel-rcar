FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://defconfig \
    ${@bb.utils.contains('DISTRO_FEATURES', 'enable_virtio', ' file://vsock.cfg', '', d)} \
    file://xen-dom0less.dtsi;subdir=git/arch/${ARCH}/boot/dts/renesas \
"

SRCREV = "38093f11d336ef488ac80466a35ad06668b2e07d"
