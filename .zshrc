POWERLEVEL9K_MODE='nerdfont-complete'
# default POWERLEVEL9K
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

# custom POWERLEVEL9K
zsh_adfscli_profile(){
  if [ -d ~/.aws/adfs-running.lock ]; then
    CURRENT_PROFILE=$(cat ~/.aws/current_profile)
    echo -n "\uf270 ${CURRENT_PROFILE}"
  else
    echo -n ""
  fi
}

POWERLEVEL9K_CUSTOM_ADFSCLI_PROFILE="zsh_adfscli_profile"
POWERLEVEL9K_CUSTOM_ADFSCLI_PROFILE_BACKGROUND="orange1"
POWERLEVEL9K_CUSTOM_ADFSCLI_PROFILE_FOREGROUND="black"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_adfscli_profile dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)


if [ -f ~/workspace/.dotfiles/is_work ]; then
  source ~/workspace/.dotfiles/work.zsh
  source ~/workspace/.dotfiles/.zsh_work_aliases
fi

if [ -f ~/workspace/.dotfiles/.zsh_aliases ]; then
  source ~/workspace/.dotfiles/.zsh_aliases
fi

source ~/.zplug/init.zsh

zplug zsh-users/zsh-syntax-highlighting, as:plugin, from:github
zplug zsh-users/zsh-autosuggestions, as:plugin, from:github
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/terraform", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug mafredri/zsh-async, as:plugin, from:github

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

export PATH="/usr/local/bin:/usr/local/aws/bin:${PATH}:~/bin"

# some completion
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/aws/bin/aws_zsh_completer.sh
