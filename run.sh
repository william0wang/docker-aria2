#!/bin/sh

touch ${CFG_PATH}/aria2.session

darkhttpd /aria2-webui --port 80 &
darkhttpd /data --port 8080 &
aria2c --conf-path=${CFG_FILE}