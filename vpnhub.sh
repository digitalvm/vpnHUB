#!/bin/bash

# vpnHUB 

function debian_update {
	ip=`grep address /etc/network/interfaces | grep -v 127.0.0.1  | awk '{print $2}'`
	apt-get update
	apt-get install openvpn libssl-dev  openssl
}

echo 'nothing todo'
exit 1