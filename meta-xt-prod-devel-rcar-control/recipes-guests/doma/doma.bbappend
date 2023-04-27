FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

RDEPENDS:${PN} += "backend-ready"

SRC_URI += "\
    file://doma-vdevices.cfg \
    file://doma-set-root \
    file://doma-set-root.conf \
"

FILES:${PN} += " \
    ${libdir}/xen/bin/doma-set-root \
    ${sysconfdir}/systemd/system/doma-create.service.d/doma-set-root.conf \
"

do_install:append() {
    # Excluding virtual devices, until we support starting QEMU with
    # virtio devices in DomD from the Dom0
    # cat ${WORKDIR}/doma-vdevices.cfg >> ${D}${sysconfdir}/xen/doma.cfg

    # Install doma-set-root script and the drop-in file to run it
    install -d ${D}${libdir}/xen/bin
    install -m 0744 ${WORKDIR}/doma-set-root ${D}${libdir}/xen/bin
    install -d ${D}${sysconfdir}/systemd/system/doma-create.service.d
    install -m 0644 ${WORKDIR}/doma-set-root.conf ${D}${sysconfdir}/systemd/system/doma-create.service.d
}
