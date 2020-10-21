

#!/bin/bash
# $1 = Domain Name
# $2 = Admin User

# update package lists
apt-get update
apt-get install krb5-user samba sssd sssd-tools libnss-sss libpam-sss ntp ntpdate realmd adcli

# discover domain
realm discover $1

# initialize Kerberos
kinit -V $2

# domain join VM
realm join $1 -U "$2" --install=/ 