#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


### Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# check https://github.com/mathiasbynens/dotfiles/blob/master/.macos for more settings


### Dock 
defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.dock autohide -bool TRUE
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock orientation left
defaults write com.apple.dock magnification -bool FALSE
defaults write com.apple.dock launchanim -bool FALSE
defaults write com.apple.dock tilesize -integer 32
defaults write com.apple.dock mineffect scale
killall Dock

#reset to defaults
#defaults delete com.apple.dock; killall Dock


### Finder
#defaults write com.apple.finder AppleShowAllFiles -bool TRUE
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist
#killall Finder


### System
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes


### Power
sudo pmset -b displaysleep 10
sudo pmset -c displaysleep 60


# Get colortheme for iTerm
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Monokai%20Remastered.itermcolors -o Monokai\ Remastered.itermcolors
