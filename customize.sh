#!/bin/bash

## Remove default root password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

## Set default theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' openwrt/package/lean/default-settings/files/zzz-default-settings

## Set default language to auto (remove forced language setting)
sed -i '/config language/d' openwrt/package/lean/default-settings/files/zzz-default-settings
