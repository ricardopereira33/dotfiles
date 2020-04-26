# ------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------
# Contains several functions to simply the script:
# - Printers
# - Installers
# - Links
#
# ------------------------------------------------------------------------

# Print helpers
function print     { printf "$1%-9s$RESET  %s\n" "[$2]" "$3"; }
function info      { print $WHITE "INFO"    "$1"; }
function success   { print $GREEN "SUCCESS" "$1"; }
function no_effect { print $BLUE  "SUCCESS" "$1"; }
function error     { print $RED   "ERROR"   "$1"; }

# --------------------------------
# Package Manager
# --------------------------------

function install_homebrew {
  if ! command -v brew > /dev/null 2>&1; then
    info "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew analytics off
    success "Successfully installed Homebrew."
  else
    no_effect "Homebrew already installed."
  fi
}

# --------------------------------
# Installation scripts
# --------------------------------

# Suppress the output of eval command
# silent_eval <tool> <command>
function silent_eval {
  info "Installing $1..."
  eval $2 > /dev/null 2>&1

  if [[ $? -eq 0 ]]; then
    success "Successfully installed $1."
  else
    error "Failed to install $1."
  fi
}

# brew_install_app <name> <brew_cask_id>
function brew_install_app {
  if [ ! -d "/Applications/$1.app" ]; then
    silent_eval $1 "brew cask install $2"
  else
    success "$1 is already installed."
  fi
}

# mas_install_app <name>
function mas_install_app {
  if [ ! -d "/Applications/$1.app" ]; then
    mas_id="mas search $1 | \
      awk -F\" \" '{print \$1}' | \
      head -n 1"

    silent_eval $1 "mas install $mas_id"
  else
    no_effect "$1 is already installed."
  fi
}

# install_cli <name> <install_operation> <condition_to_install>
function install_cli {
  eval $3 > /dev/null 2>&1

  if [[ $? -eq 0 ]]; then
    silent_eval $1 $2
  else
    no_effect "$1 is already installed."
  fi
}

# asdf_install <name> <command_provided_by_tool>
function asdf_install {
  if ! command -v $2 > /dev/null 2>&1; then
    info "Installing $1..."

    asdf plugin-add $1             > /dev/null 2>&1
    asdf install $1                > /dev/null 2>&1
    asdf global $1 $(asdf list $1) > /dev/null 2>&1

    success "Successfully installed $1."
  else
    no_effect "$1 is already installed."
  fi
}

# --------------------------------
# Links
# --------------------------------

function link {
  if [ ! -L $2 ]; then
    info "Configure $2..."
    ln -s $1 $2 # > /dev/null 2>&1

    if [[ $? -eq 0 ]]; then
      success "Successfully configured $2."
    else
      error "Failed to configure $2"
    fi
  else
    no_effect "$2 is already configured."
  fi
}
