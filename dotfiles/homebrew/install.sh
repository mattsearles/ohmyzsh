#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

brew update
brew upgrade

formulas=(
ack
automake
e2fsprogs
gcc
gh
git
gnu-sed
grep
libevent
libidn
libimobiledevice
libksba
mkcert
nss
openssh
p7zip
perl
php
python@3.8
qt
screen
ssh-copy-id
svn
telnet
tree
vim
wget
z
zlib)

brew install ${formulas[@]}

brew tap homebrew/cask-drivers

#ask for sudo password upfront
sudo -v
#Install applications via cask
# Apps
brew tap adoptopenjdk/openjdk
apps=(
aerial
alfred
appcleaner
caffeine
disk-inventory-x
firefox
google-chrome
handbrake
iterm2
microsoft-word
microsoft-excel
microsoft-powerpoint
opera
skype
spectacle
slack
sonos
textmate
vlc
whatsapp
zoom
)

echo "installing apps..."
brew install --cask ${apps[@]}

brew tap homebrew/cask-fonts                    # you only have to do this once!

# fonts
fonts=(
  font-clear-sans
  font-roboto
  font-inconsolata
)

# install fonts
echo "installing fonts..."
brew install --cask ${fonts[@]}

# Remove outdated versions from the cellar.
brew cleanup

exit 0
