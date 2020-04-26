# ------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------

source "./variables.sh"

# Print helpers
function print   { echo -e "$1[$2]$RESET $3" }
function info    { print $BLUE "INFO" "$1" }
function success { print $GREEN "SUCCESS" "$1" }
function error   { print $RED "ERROR" "$1" }

function dirlink {
  (cd $HOME && ln -s "$DOTFILES_PATH/$1" "$2")
}

# --------------------------------
# Package Manager
# --------------------------------

function install_homebrew {
  if ! command -v brew > /dev/null 2>&1; then
    info "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew analytics off
    success "Finished installing Homebrew."
  else
    success "Homebrew already installed"
  fi
}

# --------------------------------
# Installation scripts
# --------------------------------

# brew_install_app <name> <brew_cask_id>
function brew_install_app {
  if [ ! -d "/Applications/$1.app" ]; then
    silent_eval $1 "brew cask install $2"
  else
    success "$1 is already installed."
  fi
}

# mas_install_app <name> <brew_cask_id>
function mas_install_app {
  if [ ! -d "/Applications/$1.app" ]; then
    mas_id="mas search $1 | \
      awk -F" " '{print $1}' | \
      head -n 1"

    silent_eval $1 "mas install $mas_id"
  else
    success "$1 is already installed."
  fi
}

# install_cli <name> <operation> <condition>
function install_cli {
  eval $3 > /dev/null 2>&1

  if [[ $? -eq 0 ]]; then
    silent_eval $1 $2
  else
    success "$1 is already installed."
  fi
}

function asdf_install {
  if [[ ! command -v $2 ]]; then
    info "Installing $1..."
    asdf plugin-add $1 > /dev/null 2>&1
    asdf install $1 > /dev/null 2>&1
    asdf global $1 $(asdf list $1)
    success "Succesfully installed $1."
  else
    error "Failed to install $1."
  fi

}

# Suppress the output of eval command
function silent_eval {
  info "Installing $1..."
  eval $2 > /dev/null 2>&1

  if [[ $? -eq 0 ]]; then
    success "Succesfully installed $1."
  else
    error "Failed to install $1."
  fi
}

# Increase key repetition speed. These changes will only take effect
# after logging out and back in.
# defaults write -g InitialKeyRepeat -int 10
# defaults write -g KeyRepeat -int 1 ff
