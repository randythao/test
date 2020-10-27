

#!/bin/bash
# $1 = domain name
# $2 = domain admin username
# $3 = domain admin password
# $4 = VM host name

# update package lists
sudo apt-get -qq install realmd adcli sssd -y
sudo apt-get -qq install ntp -y
sudo apt-get -qq install -y sssd-tools samba-common krb5-user curl
sudo apt-get -qq install -f -y
