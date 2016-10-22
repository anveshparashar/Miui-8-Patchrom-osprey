#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9222144 33c23cae0b624dee68be7766ca33c3333cd93e5e 6699008 71d0b12073a7805da2d3141eb02a6838a91df86e
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:9222144:33c23cae0b624dee68be7766ca33c3333cd93e5e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6699008:71d0b12073a7805da2d3141eb02a6838a91df86e EMMC:/dev/block/bootdevice/by-name/recovery 33c23cae0b624dee68be7766ca33c3333cd93e5e 9222144 71d0b12073a7805da2d3141eb02a6838a91df86e:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
