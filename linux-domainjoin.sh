

#!/bin/bash
# $1 = domain name
# $2 = domain admin username
# $3 = domain admin password
# $4 = VM host name

# update package lists
sudo apt-get update -y
sudo apt-get install krb5-user samba sssd sssd-tools libnss-sss libpam-sss ntp ntpdate realmd adcli -y

echo $3 | kinit -V $2
echo $3 | sudo realm join --verbose $1 -U "$2" --install=/

sudo systemctl enable sssd
sudo systemctl start sssd
states="null"
states1="null"
grouPs="null"
therealm="null"
cauth="null"

sssd_conf_path=/etc/sssd/sssd.conf

sed -i 's/use_fully_qualified_names = True/use_fully_qualified_names = False/g' /etc/sssd/sssd.conf
sed -i 's/fallback_homedir = \/home\/%u@%d/#fallback_homedir = \/home\/%u@%d/g' /etc/sssd/sssd.conf

sudo service sssd restart