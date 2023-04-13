# Turn off usage of the LVDS connector
do_install:append() {
    sed -e '$a\\' \
    -e '$a\[output]' \
    -e '$a\name=LVDS-1' \
    -e '$a\mode=off' \
    -i ${D}/${sysconfdir}/xdg/weston/weston.ini
}
