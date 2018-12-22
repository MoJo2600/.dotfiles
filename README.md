# .dotfiles


## 1) install macOS applications
- Visual Studio Code [download](https://code.visualstudio.com/download)
- iTerm2 - replacement for Terminal [download](https://www.iterm2.com/downloads.html)
- ForkLift 3 - Dual pane file manager for macOS [download](https://binarynights.com/)
- Magnet - Window manager for macOS [website](http://magnet.crowdcafe.com/)
- Copy'em Paste - clipboard manager [website](http://apprywhere.com/copy-em-paste.html)

## 2) clone .dotfiles
`git clone https://github.com/christofwe/.dotfiles.git`

## 3) create file is_work if work notebook
`touch ~/workspace/.dotfiles/is_work`

## 4) run install script
`~/workspace/.dotfiles/install.sh`

## 5) setup iTerm2 to execute tmux script on startup
iterm2 --> Preference --> Profiles

Command: `/bin/zsh`

Send text at start: `~/workspace/.dotfiles/tmux.sh`
