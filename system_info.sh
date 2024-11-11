#!/bin/bash

echo "{
  \"cpu\": \"$(nproc)\",
  \"memory\": \"$(free -m | awk '/^Mem:/{print $2}')\",
  \"disk\": \"$(df -h --output=size / | tail -n 1)\"
}" > /usr/share/nginx/html/system_info.json
