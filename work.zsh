#!/usr/bin/zsh

if ! pgrep -x "adfs-cli" > /dev/null
then
    rm ~/.aws/current_profile &> /dev/null
fi

if ! ifconfig | grep '10.19.' > /dev/null 2>&1; then
  PROXY_URL="http://cias.geoaws.com:8080/"
  export http_proxy=${PROXY_URL}
  export https_proxy=${PROXY_URL}
  export no_proxy="localhost,127.0.0.1,.conti.de,.contiwan.com"
fi

PROMPT="$(cat ~/.aws/current_profile 2> /dev/null)${PROMPT}"