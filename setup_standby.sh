#!/bin/bash
# timezoneの設定
timedatectl set-timezone Asia/Tokyo

# hostsの設定 
cat <<EOF | sudo tee -a /etc/hosts
10.5.10.11 ec2-zabbix-1-cf
10.5.10.12 ec2-zabbix-2-cf
EOF

# zabbix6.0初期セットアップ

# 必要パッケージをdnfでインストール
dnf install -y perl-libs # perl-libs is needed by postgresql-contrib 


# その他zabbixとその周辺ツールのrpmをダウンロード


# zabbixと周辺ツールのインストール

# change SELinux for DB
sed -i s/'SELINUX=enforcing'/'SELINUX=disabled'/g /etc/selinux/config

# hostname設定のため再起動
shutdown -r now
