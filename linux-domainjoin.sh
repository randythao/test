

#!/bin/bash
# $1 = domain name
# $2 = domain admin username
# $3 = domain admin password
# $4 = VM host name

# update package lists
apt-get update
apt-get install krb5-user samba sssd sssd-tools libnss-sss libpam-sss ntp ntpdate realmd adcli

# configure the hosts file
sed -i "s/linux-ami/$4/g" /etc/hosts
hostnamectl set-hostname $4

realm leave $1
echo $3 | kinit linux

# join VM to the domain
realm --verbose join $1 -U "$2" --install=/

# update the SSSD configuration
echo 'ad_gpo_access_control = permissive' >> /etc/sssd/sssd.conf
service ssh restart
systemctl stop sssd
rm -rf /var/lib/sss/db/*
systemctl start sssd