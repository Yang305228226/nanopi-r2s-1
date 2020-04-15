# Nanopi R2S 固件自动编译

编译了两种固件，分别是基于 Lean 的和基于官方固件的。

| 荐 | 固件名字 | 状态 | 改动记录 | 简介 |
| :--- | :------ | :--- | :----- | :--- |
| * | FriendlyWRT | [![friendlywrt](https://github.com/songchenwen/nanopi-r2s/workflows/friendlywrt/badge.svg)](https://github.com/huang-hw/nanopi-r2s-1/actions?query=workflow%3Afriendlywrt) | [改动记录](FriendlyWRT/CHANGELOG.md) | 以 FriendlyWRT 为基础, 添加 Lean 的包 |
|   | FwF | [![FwF](https://github.com/huang-hw/nanopi-r2s-1/workflows/FwF/badge.svg)](https://github.com/songchenwen/nanopi-r2s/actions?query=workflow%3AFwF) | [改动记录](FwF/CHANGELOG.md) | FriendlyWRT with Features, 比上面的固件含有更多包 |
|   | Lean | [![lean](https://github.com/huang-hw/nanopi-r2s-1/workflows/lean/badge.svg)](https://github.com/songchenwen/nanopi-r2s/actions?query=workflow%3Alean) | [改动记录](Lean/CHANGELOG.md) | 以 Lean 为基础, 增加 FriendlyWRT 对 OpenWRT 的改动 | 
|   | LOL | [![LOL](https://github.com/huang-hw/nanopi-r2s-1/workflows/LOL/badge.svg)](https://github.com/songchenwen/nanopi-r2s/actions?query=workflow%3ALOL) | [改动记录](LOL/CHANGELOG.md) | 以[Lienol on Lean](https://github.com/Lienol/openwrt/tree/dev-lean-lede)为基础, 增加 FriendlyWRT 对 OpenWRT 的改动 |

默认 LAN 口 IP `192.168.2.1` 默认密码 `password`

无需拔 SD 卡的升级方法, 4月11日以后的固件，ssh 进路由器, 并执行 `fw_update` 后面跟上新 ROM 的 zip 文件下载 URL, 比如 `fw_update "https://github.com/songchenwen/nanopi-r2s/releases/download/FriendlyWRT-2020-04-11-bf4fc77/FriendlyWRT-2020-04-11-bf4fc77-ROM.zip"`。这种刷机方式会保留配置文件, 如果新旧 ROM 的配置文件不兼容会引发各种问题，请自行判断配置文件的兼容性。

Fork 自 [klever1988](https://github.com/klever1988/nanopi-openwrt) 和 [soffchen](https://github.com/soffchen/NanoPi-R2S)
Fork 自 [songchenwen](https://github.com/songchenwen/nanopi-r2s)  主要用于学习Action CI基本操作

主要整合了 [Passwall](https://github.com/songchenwen/openwrt-package) 和 AdguardHome

其中 [Passwall](https://github.com/songchenwen/openwrt-package) 是修改版本，支持 Clash。Passwall 比 OpenClash 的好处是，OpenClash 所有流量都需要经过 Clash 转发，有性能损耗。[Passwall](https://github.com/songchenwen/openwrt-package) 可以设置规则只转发部分流量。

启动后如果发现 Passwall 的百度和谷歌连接一直失败，但实际能访问的话，原因是固件内的 wget 版本过旧，可以 ssh 进去 `opkg update;opkg install wget` 解决。在`系统-软件包`里更新 wget 也行。

推荐使用 FriendlyWRT, CPU 1.2GHz 时温度更低，稳定性更好，性能也够用。

WAN 口 DHCP 时，NAT 性能和温度 ⬇️

![DHCP NAT](images/r2s_dhcp_nat.png)

WAN 口 PPPOE 时，NAT 性能和温度 ⬇️

![PPPOE NAT](images/r2s_pppoe_nat.png)

Fast.com 测速 ⬇️

![fast.com](images/r2s_fastcom.png)

Fast.com 测速 WAN 口 DHCP 时 CPU 占用和温度 （ WAN 口 PPPOE 的话，CPU 占用增加 20% 左右 ） ⬇️

![fast.com](images/r2s_fastcom_nat.png)

