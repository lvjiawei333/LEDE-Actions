#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

#Modify default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate
#git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
#git clone https://github.com/kenzok8/small package/small
#git clone https://github.com/liuran001/openwrt-packages package/openwrt-packages
#git clone https://hub.fastgit.org/OpenWrt-Actions/openwrt-package-lienol.git package/openwrt-package-lienol
#复制内核5.10版本CPU超频补丁
cp -rf files/322-mt7621-fix-cpu-clk-add-clkdev.patch target/linux/ramips/patches-5.10/322-mt7621-fix-cpu-clk-add-clkdev.patch
#复制修改32MK2P（如果后续增加mt7621机型请注释掉第二行，重新修改）
#cp -rf files/mt7621_phicomm_k2p.dts /target/linux/ramips/dts/mt7621_phicomm_k2p.dts
#cp -rf files/mt7621.mk /target/linux/ramips/image/mt7621.mk
#设置WIFI
#sed -i 's/OpenWrt/coolxiaomi/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/wireless.default_radio${devidx}.encryption=none/wireless.default_radio${devidx}.encryption=psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a\set wireless.default_radio${devidx}.key=coolxiaomi' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#切换ramips内核到5.10
sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.10' target/linux/ramips/Makefile
