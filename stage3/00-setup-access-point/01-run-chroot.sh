#!/bin/bash

set -euo pipefail

# enable access point daemon
systemctl unmask hostapd
systemctl enable hostapd

# enable IPv4 routing
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.d/routed-ap.conf

# enable NAT for AP clients, save rules so they load at boot
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
netfilter-persistent save

# give the dongle a static IP and disable management by wpa_supplicant
cat >> /etc/dhcpcd.conf <<EOF

interface wlan1
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant
EOF

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

cat > /etc/dnsmasq.conf <<EOF
interface=wlan1
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h
domain=wlan
address=/gw.wlan/192.168.4.1
EOF

cat > /etc/hostapd/hostapd.conf <<EOF
country_code=${WPA_COUNTRY:-US}
interface=wlan1
ssid=seagen-extender
hw_mode=g
channel=7
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=${AP_PASSWORD}
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOF
