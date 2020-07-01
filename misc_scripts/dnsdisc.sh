#!/bin/bash

if [ -z "$1" ]; then
echo "[!] Missing target domain"
echo "[*] Usage : $0 <domain name>"
exit 0
fi

for ip in $(cat dnslist);do
host $ip.$1 | grep "has address";
done
