#!/bin/bash

echo export DB_HOST="mongodb://33.33.2.122:27017/posts" | sudo tee -a /etc/profile
. /etc/profile
cd app/app/
sudo -E npm install
sudo -E pm2 start app.js
