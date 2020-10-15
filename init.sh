sudo apt update
sudo apt install python3.5
sudo apt-get install -y python3.5-dev
sudo rm /usr/bin/python3
sudo ln -s /usr/bin/python3.5 /usr/bin/python3
sudo pip3 install --upgrade pip
sudo -H pip3 install --upgrade django==2.1
sudo -H pip3 install --upgrade gunicorn

sudo pip3 install virtualenv
sudo pip3 install pathlib2
virtualenv -p python3.5 venv
source venv/bin/activate
pip3 install django2.0

sudo rm -rf /etc/nginx/sites-enabled/default

sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/nginx_2_1_11.conf

sudo /etc/init.d/nginx restart

gunicorn -w 2 -c /home/box/web/etc/hello.py hello:app & gunicorn -w 2 -c /home/box/web/etc/qa.py ask.wsgi:application & curl -vv 'http://127.0.0.1:8000/login/'
