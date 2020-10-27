

#!/bin/bash
# $1 = domain name
# $2 = domain admin username
# $3 = domain admin password
# $4 = VM host name

# update package lists
sudo apt-get update -y
sudo apt-get install krb5-user samba sssd sssd-tools libnss-sss libpam-sss ntp ntpdate realmd adcli -y
