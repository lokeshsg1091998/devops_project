#!/bin/bash
if [ -f "/etc/systemd/system/gunicorn.socket" ]; then
    echo "file exists"
else
    sudo cp gunicorn.socket /etc/systemd/system/gunicorn.socket
fi
if [ -f "/etc/systemd/system/gunicorn.service" ]; then
    echo "file exists"
else
    sudo cp gunicorn.service /etc/systemd/system/gunicorn.service
fi
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket
sudo systemctl daemon-reload
sudo systemctl restart gunicorn