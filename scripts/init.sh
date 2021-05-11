#!/bin/bash

cd app/app/
npm install
pm2 kill
pm2 start app.js
