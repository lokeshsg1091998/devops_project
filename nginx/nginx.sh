#!/bin/bash
sudo apt update
sudo apt install nginx -y
if [ -f "/etc/nginx/sites-available/devopssec" ]; then
    echo "file exists"
else
    sudo cp devopssec /etc/nginx/sites-available/devopssec
fi
if [ -f "/etc/nginx/sites-available/default" ]; then
    sudo rm /etc/nginx/sites-available/default
else
    echo "file already deleted"
fi
if [ -e "/etc/nginx/sites-enabled/default" ]; then
    sudo rm /etc/nginx/sites-enabled/default
else
    echo "file already deleted"
fi
if [ -L "/etc/nginx/sites-enabled/devopssec" ] && [ "$(readlink -f /etc/nginx/sites-enabled/devopssec)" == "/etc/nginx/sites-available/devopssec" ]; then
    echo "The site is correctly linked."
else
    echo "The site is not linked. Linking now..."
    sudo ln -sf /etc/nginx/sites-available/devopssec /etc/nginx/sites-enabled/devopssec
    echo "Link created."
fi
sudo systemctl restart nginx