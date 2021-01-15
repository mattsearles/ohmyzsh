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
certbot
clamav
e2fsprogs
gcc
gh
git
gnu-sed
grep
jenv
libevent
libidn
libimobiledevice
libksba
liquibase
maven@3.2
mkcert
nss
openssh
p7zip
perl
petere/postgresql/postgresql-common
petere/postgresql/postgresql@13
php
python@3.8
qt
rbenv
screen
ssh-copy-id
telnet
tomcat@8
tree
vim
wget
z
zlib)

brew install ${formulas[@]}

#ask for sudo password upfront
sudo -v
#Install applications via cask
# Apps
brew tap adoptopenjdk/openjdk
apps=(
adoptopenjdk8
aerial
alfred
appcleaner
atom
caffeine
disk-inventory-x
firefox
google-chrome
handbrake
iterm2
microsoft-word
microsoft-excel
microsoft-powerpoint
nordvpn
opera
pgadmin4
skype
spectacle
slack
springtoolsuite
sublime-text
textmate
tibco-jaspersoft-studio
vlc
vagrant
vagrant-manager
virtualbox
virtualbox-extension-pack
whatsapp
zoomus
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
