#!/usr/local/bin/bash

# -------------------------------------------------------------------------
# Installation
# -------------------------------------------------------------------------
# This script installs and configures the macOS with my personal settings.
#
# The script can be executed as many times you want because the
# installation process is idempotent.
#
# Usage:
# ./install.sh
#
# -------------------------------------------------------------------------

# Load functions that simplify the script
source ./installation/constants.sh
source ./installation/helpers.sh

# -------------------------------------------------------------------------
# Command line tools
# -------------------------------------------------------------------------
# First, it installs homebrew and mas, which allow to install the other
# applications on macOS.
#
# The command line that cannot be installed with homebrew or mas, are
# installed through install_cli or asdf_install:
#
# install_cli  <name> <install_operation> <condition_to_install>
# asdf_install <name> <command_provided_by_tool>
#
# -------------------------------------------------------------------------

install_cli "macOS command line tools" \
  "xcode-select --install" \
  '[[ "$(xcode-select -p)" == "" ]]'

install_homebrew

install_cli "Mas"  "brew install mas"  "! command -v mas"
install_cli "Asdf" "brew install asdf" "! command -v asdf"
install_cli "Bash" "brew install bash" "! command -v /usr/local/bin/bash"
install_cli "Zsh"  "brew install zsh"  "! command -v zsh"

install_cli "Oh-my-zsh" \
  'sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' \
  '[ ! -d "$HOME/.oh-my-zsh" ]'

install_cli "Antibody" \
  "brew install getantibody/tap/antibody" \
  "! command -v antibody"

# Dependencies
install_cli "Openssl"  "brew install openssl"  "! command -v openssl"
install_cli "Autoconf" "brew install autoconf" "! command -v autoconf"
install_cli "Automake" "brew install automake" "! command -v automake"
install_cli "Libtool"  "brew install libtool"  "! command -v libtool"

# Progamming languages
install_cli "Python 2.7" "brew install python@2" "! command -v python2.7"
install_cli "Python 3"   "brew install python"   "! command -v python3"
install_cli "Node"       "brew install node"     "! command -v npm"
install_cli "Go"         "brew install go"       "! command -v go"

asdf_install ruby   irb
asdf_install erlang erl
asdf_install elixir iex

# Tools
install_cli "bat"  "brew install bat"  "! command -v bat"
install_cli "tldr" "brew install tldr" "! command -v tldr"

install_cli "fzf" \
  "brew install fzf && $(brew --prefix)/opt/fzf/install" \
  "! command -v fzf"

install_cli "Diff-so-fancy" \
  "brew install diff-so-fancy" \
  "! command -v diff-so-fancy"

# Vim
install_cli "NeoVim" \
  "brew install neovim && pip3 install neovim" \
  "! command -v nvim"

install_cli "Vim Plug" \
  'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
  "[ ! -f ~/.vim/autoload/plug.vim ]"

# -------------------------------------------------------------------------
# Configurations
# -------------------------------------------------------------------------

if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config
fi

for DOTFILE_PATH in ${!CONFIG_PATHS[@]}; do
  link $DOTFILE_PATH ${CONFIG_PATHS[$DOTFILE_PATH]}
done

# Fira code font
info "Installing fira-code font..."
brew tap homebrew/cask-fonts     > /dev/null 2>&1
brew cask install font-fira-code > /dev/null 2>&1
success "Successfully installed fira-code."

# -------------------------------------------------------------------------
# Applications
# -------------------------------------------------------------------------
# All applications are installed through brew or mas command.
# Therefore, the syntax to install a new app is:
#
# brew_install_app <app_name> <brew_cask_id>
# mas_install_app <app_name>
#
# -------------------------------------------------------------------------

brew_install_app "Visual Studio Code" "visual-studio-code"

brew_install_app "Slack"       "slack"
brew_install_app "Firefox"     "firefox"
brew_install_app "Spotify"     "spotify"
brew_install_app "iTerm"       "iterm2"
brew_install_app "Spectacle"   "spectacle"
brew_install_app "Postman"     "postman"
brew_install_app "Docker"      "docker"
brew_install_app "Tunnelblick" "tunnelblick"

mas_install_app "Spark"

zsh
