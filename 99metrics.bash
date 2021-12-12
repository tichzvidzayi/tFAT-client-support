# Author: Tichaona Zvidzayi
# Date :  20 November 2019
############################################################################################
# sudo bash -c ‘echo “ ” > /usr/local/sbin/99metrics.sh‘  #creating script file
# 
# sudo chmod 777 /usr/local/sbin/99metrics.sh 
# sudo vim /usr/local/sbin/99metrics.sh      #use vim or any editor of choice

#############################################################################################
# A bash script to allow fat clients to route external network

#!/bin/bash 
ifmetric eno1 50     #connects to the public Internet (external network)
ifmetric enp2so 100   #connects the private network
echo 1 > /proc/sys/net/ipv4/ip_forward                              # turned off by default
iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
iptables -A FORWARD -i eno1 -o enp2s0 -m state -–state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp2s0 -o eno1 -j ACCEPT
