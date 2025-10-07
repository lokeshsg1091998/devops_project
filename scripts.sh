#!/bin/bash
sudo apt update
sudo apt install python3-venv -y
sudo apt-get install pkg-config libmysqlclient-dev python3-dev -y
python3 -m venv env
source env/bin/activate
sudo apt install python3-pip -y
pip install -r requirements.txt
python3 manage.py makemigrations
python3 manage.py migrate
cd gunicorn_folder
sudo chmod +x gunicorn.sh
./gunicorn.sh
cd /home/ubuntu/cicd/workspace/devops_pipeline
cd nginx
sudo chmod +x nginx.sh
./nginx.sh