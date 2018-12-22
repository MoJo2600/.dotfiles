#!/bin/zsh

if [ -f ${WORKDIR}/.dotfiles/is_work ]; then
  
  tmux ls | grep $(hostname -s)
  
  if [ $? -eq 0 ]; then
    tmux attach -t $(hostname -s)
  else
    tmux new -d -s $(hostname -s)
    
    tmux neww -d -n workspace 'cd ~/workspace && zsh'
    tmux select-window -t workspace
    tmux split-window -d -h -p 50 'cd ~/workspace && zsh'
    
    tmux neww -d -n adfs-cli 'cd ~ && zsh'
    tmux select-window -t adfs-cli
    tmux split-window -d -h -p 50 'cd ~/workspace && zsh'
    tmux select-pane -t 1
    tmux split-window -d -v -p 80 'cd ~/workspace && zsh'
    
    tmux neww -d -n misc 'cd ~ && zsh'
    
    tmux select-window -t :2
    
    tmux attach -t $(hostname -s)
  fi
  
else  
  tmux ls | grep $(hostname -s)
  
  if [ $? -eq 0 ]; then
    tmux attach -t $(hostname -s)
  else
    tmux new -d -s $(hostname -s)
    
    tmux neww -d -n workspace 'cd ~/workspace && zsh'
    tmux select-window -t workspace
    tmux split-window -d -h -p 50 'cd ~/workspace && zsh'
    
    tmux neww -d -n openhab 'cd ~ && zsh'
    
    tmux neww -d -n pihole 'cd ~ && zsh'
    
    tmux neww -d -n hyperion 'cd ~ && zsh'
    
    tmux select-window -t :1
    
    tmux attach -t $(hostname -s)
  fi

fi
