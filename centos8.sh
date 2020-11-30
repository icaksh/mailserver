#!/bin/bash

#####################################
#     MAILSERVER INSTALLER
#     ON CENTOS 8
#####################################

## I build this script because I want to have a private cheaper mailserver
## Also can builded on low spec server (1GB RAM and 1 core CPU)
## Yea

# This script will install Postfix, Dovecot, PHP, and (Apache or Nginx)
# Recomended to use fresh server, but you can use

# Update
sudo dnf update

# Open Ports
sudo firewall-cmd --permanent --add-service={http,https,smtp-submission,smtps,imap,imaps}
sudo systemctl reload firewalld

# Installing Postfix, Dovecot
sudo dnf install epel-release -y
sudo dnf install postfix dovecot firewall-d certbot -y

# Make Postfix Accept Ingress Connection (from another SMTP Server)
sudo postconf -e "inet_interfaces = all"

