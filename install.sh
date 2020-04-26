#!/bin/sh

# This script installs and configures the macOS with my personal settings.

source "./installation/helpers.sh"

# -------------------------------------------------------------------------
# Command line tools
# -------------------------------------------------------------------------
# First, it installs homebrew and mas, which allow to install the other
# applications on macOS.
#
# The command line that cannot be install with homebrew or mas, are
# installed through install_cli:
#
# install_cli <name> <install_operation> <condition_to_install>
# -------------------------------------------------------------------------

install_cli "macOS command line tools" \
  "xcode-select --install" \
  '[[ "$(xcode-select -p)" == "" ]]'

install_homebrew

install_cli "Mas" "brew install mas" "! command -v mas"
install_cli "Asdf" "brew install asdf" "! command -v asdf"

install_cli "Zsh" "brew install zsh" "! command -v zsh"
install_cli "Oh-my-zsh" \
 "sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"" \
 '[ ! -d "$HOME/.oh-my-zsh" ]'

install_cli "Python 2.7" "brew install python@2" "! command -v python2.7"
install_cli "Python 3" "brew install python" "! command -v python3"

asdf_install "ruby" "rb"
asdf_install "erlang" "erl"
asdf_install "elixir" "iex"

install_cli "Neovim" \
  "brew install neovim && pip3 install neovim" \
  "! command -v nvim"

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

brew_install_app "Slack" "slack"
brew_install_app "Visual Studio Code" "visual-studio-code"
brew_install_app "Firefox" "firefox"
brew_install_app "Spotify" "spotify"
brew_install_app "iTerm" "iterm2"
brew_install_app "Tunnelblick" "tunnelblick"
brew_install_app "Spectacle" "spectacle"
brew_install_app "Postman" "postman"
brew_install_app "Docker" "docker"

mas_install_app "Spark"

# -------------------------------------------------------------------------
# Configurations
# -------------------------------------------------------------------------


