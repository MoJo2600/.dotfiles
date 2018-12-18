if [ -f ~/workspace/.dotfiles/is_work ]; then
  source ~/workspace/.dotfiles/work.zsh
fi

if [ -f ~/workspace/.dotfiles/.zsh_aliases ]; then
  source ~/workspace/.dotfiles/.zsh_aliases
fi

source ~/.zplug/init.zsh

zplug zsh-users/zsh-syntax-highlighting, as:plugin, from:github
zplug zsh-users/zsh-autosuggestions, as:plugin, from:github
zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/terraform", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug mafredri/zsh-async, as:plugin, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# ctrl + space for auto suggest
bindkey '^ ' autosuggest-execute

# enable ..<tab>
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/${USER}/Library/Python/2.7/bin:/usr/local/bin:${PATH}"
export SHELL="/bin/zsh"