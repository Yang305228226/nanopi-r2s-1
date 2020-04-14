#!/bin/bash
cd friendlywrt-rk3328
find device/ -name distfeeds.conf -delete
cd friendlywrt
echo "=======git config======="
git config --global user.email "action@github.com" && git config --global user.name "GitHub Action"
echo "=======git remote======="
git remote add upstream https://github.com/Lienol/openwrt.git && git fetch upstream
echo "=======git checkout======="
git checkout upstream/dev-lean-lede -b tmp
echo "=======git set_repo_hash.h======="
../../set_repo_hash.sh Lienol
echo "=======git commit======="
git mv README.md README && git commit -m 'undo rename readme for rebasing'
echo "=======git checkout======="
git checkout origin/master-v19.07.1
echo "=======git rebase======="
git rebase adc1a9a3676b8d7be1b48b5aed185a94d8e42728^ --onto tmp -X ours
echo "=======git status======="
git status
echo "=======git check1======="
git checkout upstream/dev-lean-lede -- feeds.conf.default
echo "=======git check2======="
git checkout upstream/dev-lean-lede -- package/kernel/mac80211/files/lib/netifd/mac80211.sh
echo "=======git status======="
git status
echo "=======feeds.conf.default======="
cat feeds.conf.default
