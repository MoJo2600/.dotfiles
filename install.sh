#/bin/bash

export WORKDIR=~/workspace
cd ${WORKDIR}/

### install home brew
if ! type "brew" > /dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
  echo "brew.sh already installed!"
fi
brew install pv tmux zsh

### install zplug
if [ ! -d ~/.zplug ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  else
  echo "zplug already installed!"
fi

### install tmux config
if [ ! -d "tmux-config" ]; then
  git clone https://github.com/christofwe/tmux-config.git
  ./tmux-config/install.sh
  else
  echo "tmux-config already installed!"
fi

### install powerline fonts
if [ ! -d "fonts" ]; then
  git clone https://github.com/powerline/fonts.git --depth=1
  ./fonts/install.sh
  else
  echo "powerline fonts already installed!"
fi

### install tmux bash completion
if [ ! -d "tmux-bash-completion" ]; then
  git clone https://github.com/imomaliev/tmux-bash-completion.git
  else
  echo "tmux-bash-complettion already installed!"
fi

### install custom configs 
if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ${WORKDIR}/.dotfiles/.vimrc ~/.vimrc;

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
fi
ln -s ${WORKDIR}/.dotfiles/.zshrc ~/.zshrc

### install AWS cli
if ! type "aws" > /dev/null 2>&1; then
  curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
  unzip awscli-bundle.zip
  sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
  rm -Rf ./awscli-bundle/
fi

### install tools for work
if [ -f ${WORKDIR}/.dotfiles/is_work ]; then
  
  ## install adfs-cli clone and link binary
  if [ ! -d "adfs-cli" ]; then
    git clone https://github.conti.de/continental-cloud/adfs-cli
    ln -s ${WORKDIR}/adfs-cli/releases/adfs-cli-macos /usr/local/bin/adfs-cli
    else
    echo "adfs-cli already installed!"
  fi

  ## install hashicorp tools
  if ! type "terraform" > /dev/null 2>&1; then
    ${WORKDIR}/.dotfiles/install_hashicorp.sh
    else
    echo "terraform already installed!"
  fi

  else
  echo "not a work machine"

fi