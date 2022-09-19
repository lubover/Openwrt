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

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#删除自带低版本xray-core
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

#删除一些zzz中的脚本
sed -i '/DISTRIB_/d' package/default-settings/files/zzz-default-settings
sed -i '/footer.htm/d' package/default-settings/files/zzz-default-settings
sed -i '/admin_status/d' package/default-settings/files/zzz-default-settings

#改主机名
sed -i 's/OpenWrt/Lubov/g' package/base-files/files/bin/config_generate

# 取消原主题luci-theme-bootstrap 为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改 argon 为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 删除原默认主题
rm -rf package/lean/luci-theme-bootstrap
