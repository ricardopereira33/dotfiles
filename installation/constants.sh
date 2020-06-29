# ------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------
# Contains global variables used in all scripts as constants.
#
# ------------------------------------------------------------------------

# Colors definitions.
GREEN='\033[1;32m'
WHITE='\033[1;37m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[1;91m'
RESET='\033[0m'

# Dotfiles directory
DIR=$HOME/Documents/dotfiles

declare -A CONFIG_PATHS=(
  ["$DIR/zsh/starship.toml"]="$HOME/.config/starship.toml"
  ["$DIR/zsh"]="$HOME/.config/zsh"
  ["$DIR/nvim"]="$HOME/.config/nvim"
  ["$DIR/.vimrc"]="$HOME/.vimrc"
  ["$DIR/.zshrc"]="$HOME/.zshrc"
  ["$DIR/.gitconfig"]="$HOME/.gitconfig"
)
