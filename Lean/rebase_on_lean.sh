#!/bin/bash
cd friendlywrt-rk3328
find device/ -name distfeeds.conf -delete
cd friendlywrt
echo "==========git config==========="
git config --global user.email "action@github.com" && git config --global user.name "GitHub Action"
echo "==========git set_repo_hash==========="
../../set_repo_hash.sh Lean https://github.com/coolsnowwolf/lede.git
echo "==========git add==========="
git remote add upstream https://github.com/coolsnowwolf/lede.git && git fetch upstream
echo "==========git rebase==========="
git rebase adc1a9a3676b8d7be1b48b5aed185a94d8e42728^ --onto upstream/master -X ours
echo "==========git status==========="
git status
echo "==========git checkout feeds==========="
git checkout upstream/master -- feeds.conf.default
echo "==========git checkout mac==========="
git checkout upstream/master -- package/kernel/mac80211/files/lib/netifd/mac80211.sh
echo "==========git status==========="
git status
echo "==========show feeds.conf.default==========="
cat feeds.conf.default
