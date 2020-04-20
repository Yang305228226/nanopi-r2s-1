#!/bin/bash
cd friendlywrt-rk3328/friendlywrt
cd package/lean/
rm -rf luci-theme-argon
pwd
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
cd luci-theme-argon
../../../../../set_repo_hash.sh Argon
cd ../..

pwd
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git
cd luci-app-adguardhome
../../../../set_repo_hash.sh AdguardHome
cd ..

pwd
git clone https://github.com/tty228/luci-app-serverchan.git
../../../set_repo_hash.sh ServerChan

pwd
git clone https://github.com/huang-hw/OpenAppFilter.git
cd OpenAppFilter
../../../../set_repo_hash.sh OpenAppFilter
pwd
cd ../../../kernel/net/
pwd
mkdir oaf
ls -l
cd ../../friendlywrt/package/OpenAppFilter/
sed -i 's/+kmod-oaf //' luci-app-oaf/Makefile
cat luci-app-oaf/Makefile
pwd
cp oaf/src/* ../../../kernel/net/oaf/
rm oaf/ -rf
ls -l
cd ../../../kernel/net/oaf
pwd
ls -l
#sed -i 's/^obj-m/obj-y/' Makefile
#cat Makefile
#sed -i '$aobj-y += oaf\/' ../Makefile
sed -i '$aobj-m += oaf\/' ../Makefile
cat ../Makefile
sed -i 's/int af_log_lvl = 1/int af_log_lvl = 4/' af_log.c
sed -i 's/skip_spaces/skip_spaces_oaf/' af_utils.c
#sed -i 's/printk/pr_info/' *.c
#sed -i 's/AF_INFO/pr_info/' app_filter.c
#sed -i 's/printk/pr_info/' app_filter.c
cat app_filter.c
cat af_log.c
cat af_utils.c
cd ../../../friendlywrt

pwd
echo "src-git scw https://github.com/songchenwen/openwrt-package" >> feeds.conf.default
../../set_repo_hash.sh ScwPackage https://github.com/songchenwen/openwrt-package.git

echo ""
echo "feeds.conf.default"
cat feeds.conf.default
