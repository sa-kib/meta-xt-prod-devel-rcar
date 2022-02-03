DESCRIPTION = "Qt Quick 3D demo cluster"

LICENSE = "CLOSED"

inherit systemd

RDEPENDS_${PN} = " \
         qtquick3d \
         qtbase \
         qtdeclarative \
"  

FILES_${PN} = " \
    ${bindir}/dual-render-3d-part \
    ${systemd_unitdir}/system/3d-part.service \
    ${sysconfdir}/eglfs.conf \
"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://3d-part.service \
	file://dual-render-3d-part \
	file://eglfs.conf \
"

SYSTEMD_SERVICE_${PN} = "3d-part.service"

do_install_append() {
  install -d ${D}/${systemd_unitdir}/system
  install -d ${D}/${bindir}
  install -d ${D}/${sysconfdir}
  install -m 0644 ${WORKDIR}/3d-part.service ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/dual-render-3d-part ${D}/${bindir}/
  install -m 0644 ${WORKDIR}/eglfs.conf ${D}/${sysconfdir}/
  chmod +x ${D}/${bindir}/dual-render-3d-part
}

INSANE_SKIP_${PN} = "already-stripped"
