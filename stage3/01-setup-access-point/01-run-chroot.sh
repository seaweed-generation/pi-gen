#!/bin/bash -e

systemctl unmask hostapd
systemctl disable hostapd
systemctl disable dnsmasq

cat >> /etc/dhcpcd.conf <<EOF

interface wlan0
  nohook wpa_supplicant
EOF

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

cat > /etc/dnsmasq.conf <<EOF
interface=wlan0
dhcp-range=10.0.100.2,10.0.100.20,255.255.255.0,24h
domain=wlan
address=/seagen-${DEVICE_ID}.gw/10.0.100.1
EOF

cat > /etc/hostapd/hostapd.conf <<EOF
country_code=${WPA_COUNTRY:-US}
interface=wlan0
ssid=seagen-${DEVICE_ID}
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
