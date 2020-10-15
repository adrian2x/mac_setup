#!/bin/sh
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"
xcode-select --install

echo Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Mac App Store command line interface https://github.com/mas-cli/mas
# brew install mas
echo Restore ~/Brewfile
brew bundle

# Path stuff
echo  'export PATH="/usr/local/anaconda3/bin:$PATH"' >> ~/.zshrc

echo Setup zshell
sudo echo '/usr/local/bin/zsh' >> /etc/shells
chsh -s /usr/local/bin/zsh
# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# plugins
echo  'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
echo  'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

echo Installing App Store updates
# Install Xcode, find Xcode Id and use it to install it
#xcodeId=$(mas search Xcode | head -n 1)
#mas install $xcodeId
mas upgrade
