#/bin/bash

export WORKDIR="~/workspace"

### install home brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install pv tmux zplug zsh

cd $WORKDIR/
git clone https://github.com/christofwe/tmux-config.git
./tmux-config/install.sh

cd $WORKDIR/
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh 

cd $WORKDIR/
git clone https://github.com/imomaliev/tmux-bash-completion.git


### install custom configs 
# mv ~/.bash_profile ~/.bash_profile.bak
# ln -s $WORKDIR/dotfiles/.bash_profile ~/.bash_profile;

mv ~/.vimrc ~/.vimrc.bak
ln -s $WORKDIR/dotfiles/.vimrc ~/.vimrc;

mv ~/.zshrc ~/.zshrc.bak
ln -s $WORKDIR/dotfiles/.zshrc ~/.zshrc

### install AWS cli
cd $WORKDIR/
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -Rf ./awscli-bundle/


### install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"