#!/bin/sh
apt install net-tools
route -n

echo "What is your default Gateway IP listed above?"
read gatewayip
ip route add 169.254.169.254 via $gatewayip dev eth0

echo "What is the Private IP of this Droplet?"
read privateip
ip route change default via $privateip

echo "What is the Private IP of the Gatewatay?"
read privategatewayip

sed -i '/gateway4:/d' /etc/netplan/50-cloud-init.yaml
sed -i '25,35 s|search: \[\]|search: \[\] \
            routes: \
            -   to: 0.0.0.0\/0  \
                via: '"$privategatewayip"'|gi' /etc/netplan/50-cloud-init.yaml

netplan apply -debug

if ping -q -c 4 google.com > /dev/null

then
echo "This droplet can reach other networks."
else
echo "Network failure."

fi

ip route get 8.8.8.8 | sed 's/^.*src \([^ ]*\).*$/\1/;q'