#!/bin/bash

#       vpnHUB
#       http://vpnhub.digvm.com
#       Copyright (C) 2011 Digital VM
#
#       This program is free software: you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation, either version 3 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program.  If not, see <http://www.gnu.org/licenses/>.

# vars

VPNHUB_PATH=`basename $0`
VPNHUB_TUN0=`/sbin/ifconfig | grep tun | awk '{print $1}'`
VPNHUB_IP=`grep address /etc/network/interfaces | awk '{print $2}'`
VPNHUB_ROUTE=`grep gateway /etc/network/interfaces | awk '{print $2}'`

# func

function debian6_install {
        echo -e "\nThis will install OpenVPN software on system, press CTRL+C to cancel"
        sleep 5
        apt-get update
        apt-get install openvpn libssl-dev openssl
}

function debian6_install_bin {
        echo -e "This will install vpnHUB system wide\n"
        read -p "Do you want to install vpnHUB system wide (y/n)?"

        if [ "$REPLY" == "y" ]
                then
                        echo 'Installing vpnHUB to /usr/sbin'
                        debian_install_bin1
                else
                        echo 'Quit'
                fi
        }

function debian6_install_bin1 {
        /bin/mv $VPNHUB_PATH /usr/sbin/vpnhub
        /bin/chmod +x /usr/sbin/vpnhub
        }

function debian6_nat_client {
        echo NAT $VPNHUB_TUN0 to public IP $VPNHUB_IP
        /sbin/iptables -t nat -A POSTROUTING -s $VPNHUB_TUN0 -j SNAT --to $VPNHUB_IP
        }

# debug

#debian_install_bin
#debian6_nat_client

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` --help"
  exit $E_BADARGS
fi

echo -en "\n\nSorry, vpnHUB is under development, visit http://vpnhub.digvm.com\n\n"
exit 1
