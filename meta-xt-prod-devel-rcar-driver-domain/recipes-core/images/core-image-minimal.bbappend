
IMAGE_INSTALL_append = " \
    dual-render-3d-part \
    xen-tools \
    kernel-modules \
    util-linux \
"

do_install[depends] += "arm-trusted-firmware:do_deploy"
do_install[depends] += "optee-os:do_deploy"
do_install[depends] += "u-boot:do_deploy"
do_install[depends] += "xen:do_deploy"
do_install[depends] += "xen-tools:do_deploy"

IMAGE_INSTALL_remove = " \
    dhcp-client \
"
