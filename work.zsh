#!/usr/bin/zsh

if ! pgrep -x "adfs-cli" > /dev/null
then
    rm ~/.aws/current_profile &> /dev/null
fi

PROMPT="$(cat ~/.aws/current_profile 2> /dev/null)${PROMPT}"