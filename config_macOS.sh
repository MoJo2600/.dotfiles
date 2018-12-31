#!/bin/bash

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
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist
#killall Finder

### System
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

