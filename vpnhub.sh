#!/bin/bash

# 	vpnHUB 
# 	http://vpnhub.digvm.com
#	Copyright (C) 2011 Digital VM

#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <http://www.gnu.org/licenses/>.
	

function debian_update {
	ip=`grep address /etc/network/interfaces | grep -v 127.0.0.1  | awk '{print $2}'`
	apt-get update
	apt-get install openvpn libssl-dev  openssl
}

echo 'nothing todo'
exit 1