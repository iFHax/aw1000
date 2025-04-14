#!/bin/bash

# Remove default root password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

# Set default theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' openwrt/package/lean/default-settings/files/zzz-default-settings

# Set default language to auto (remove forced language setting)
sed -i '/config language/d' openwrt/package/lean/default-settings/files/zzz-default-settings

# Set default and permanent TTL to 64
echo 'net.ipv4.ip_default_ttl=64' >> openwrt/package/base-files/files/etc/sysctl.conf

# Change default SSID to "DCWRT"
sed -i "s/option ssid.*/option ssid 'DCWRT'/" openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Change DISTRIB_DESCRIPTION to DCWRT
sed -i 's/DISTRIB_DESCRIPTION="LEDE"/DISTRIB_DESCRIPTION="DCWRT"/' openwrt/package/base-files/files/etc/openwrt_release

# Set up default OPKG feed configuration
cat <<EOF > openwrt/package/base-files/files/etc/opkg/distfeeds.conf
src/gz openwrt_core https://downloads.openwrt.org/releases/24.10.0/targets/qualcommax/ipq807x/packages
src/gz openwrt_base https://downloads.openwrt.org/releases/24.10.0/packages/aarch64_cortex-a53/base
src/gz openwrt_luci https://downloads.openwrt.org/releases/24.10.0/packages/aarch64_cortex-a53/luci
src/gz openwrt_packages https://downloads.openwrt.org/releases/24.10.0/packages/aarch64_cortex-a53/packages
src/gz openwrt_routing https://downloads.openwrt.org/releases/24.10.0/packages/aarch64_cortex-a53/routing
src/gz openwrt_telephony https://downloads.openwrt.org/releases/24.10.0/packages/aarch64_cortex-a53/telephony
EOF 
