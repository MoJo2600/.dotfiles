#!/usr/bin/env bash

if uname -a | grep "Darwin Kernel" > /dev/null; then
  ARCH="darwin_amd64"
  else
  ARCH="linux_amd64"
fi

for APPLICATION in packer terraform; do
  # download latest version of hashicorp releases page
  curl -s https://releases.hashicorp.com/${APPLICATION}/ -o $0.${APPLICATION}
  # grab latest version from html page
  APPLICATION_VERSION=$(cat $0.${APPLICATION} | grep "${APPLICATION}_" |  grep -v "-" | cut -d\> -f2 | cut -d\< -f1 | cut -d_ -f2 | head -1)
  # download version for application
  curl -s https://releases.hashicorp.com/${APPLICATION}/${APPLICATION_VERSION}/${APPLICATION}_${APPLICATION_VERSION}_${ARCH}.zip -o ${APPLICATION}_${APPLICATION_VERSION}_${ARCH}.zip
  # unpack application
  unzip -oq ${APPLICATION}_${APPLICATION_VERSION}_${ARCH}.zip -d /usr/local/bin/
  if [ $? -eq 0 ];then
    echo -ne "${APPLICATION} version: "
    ${APPLICATION} --version
  fi
  # clean up
  rm $0.${APPLICATION}
  rm ${APPLICATION}_${APPLICATION_VERSION}_${ARCH}.zip
done