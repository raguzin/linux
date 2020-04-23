#! /bin/bash

#install and configuring NTP
yum install chrony
systemctl enable chronyd
systemctl start chronyd

#configuring Firewall
firewall-cmd --permanent --add-port=514/{tcp,udp}
firewall-cmd --reload

#configuring SELinux
semanage port -m -t syslogd_port_t -p tcp 514
semanage port -m -t syslogd_port_t -p udp 514

#install rsyslog
yum install rsyslog
systemctl enable rsyslog
systemctl start rsyslog