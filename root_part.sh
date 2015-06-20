#!/bin/bash

### We set up the kerberos config file to access to 42's kerberos server.

cat >> /etc/krb5.conf << EOF
[libdefaults]
	default_realm = 42.FR
	forwardable = true
	proxiable = true
      	dns_lookup_kdc = no
      	dns_lookup_realm = no
	allow_weak_crypto = true

[realms]
	42.FR = {
                kdc = kdc1.42.fr
                kdc = kdc2.42.fr
                admin_server = kdc1.42.fr
		default_domain = 42.fr
		default_lifetime = 7d
                ticket_lifetime = 7d
	}
        STAFF.42.FR = {
                kdc = dc1.staff.42.fr
                admin_server = dc1.staff.42.fr
                default_domain = staff.42.fr
        }

[domain_realm]
	.42.fr = 42.FR
	42.fr = 42.FR
	.staff.42.fr = STAFF.42.FR
	staff.42.fr = STAFF.42.FR
EOF

### We set up the ssh config file to access to 42's git server (vogsphere)
### using your kerberos identification

cat >> /etc/ssh/ssh_config << EOF
Host *.42.fr
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF

echo "root part finished !"
