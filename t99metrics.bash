sudo bash -c ‘echo “txt” > /etc/systemd/system/myltsp.service ‘
sudo vim /etc/systemd/system/myltsp.service 

[Unit]
Description=Metrics Adjustments

[Service]
ExecStart=/usr/local/sbin/99metrics.sh

[Install]
WantedBy=multi-user.target

