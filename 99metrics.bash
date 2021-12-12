# sudo apt install ifmetric                    ## Install ifmetric 

# sudo bash -c ‘echo “txt” > /usr/local/sbin/99metrics.sh‘  #creating script file
# sudo chmod a+x /usr/local/sbin/99metrics.sh #Make it executable
# sudo chmod 777 /usr/local/sbin/99metrics.sh #Give it root rights (saves you   .                                            to write sudo every time)
# sudo vim /usr/local/sbin/99metrics.sh

#!/bin/bash 
sudo ifmetric eno1 50     #connects to the public Internet (external network)
sudo ifmetric enp2so 100   #connects the private network
##****************** FAT CLIENT SUPPORT********************************
sudo echo 1 > /proc/sys/net/ipv4/ip_forward                              # turned off by default
sudo iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
sudo iptables -A FORWARD -i eno1 -o enp2s0 -m state -–state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i enp2s0 -o eno1 -j ACCEPT
