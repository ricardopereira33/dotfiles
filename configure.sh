#!/opt/homebrew/bin/bash

source ./installation/constants.sh

if [[ $# -ne 1 ]]; then
  printf "$RED[ERROR]$RESET You need to pass one of these commands: 'remove' or 'link'\n"
  exit 1
fi

function remove {
  for LINK_PATH in ${CONFIG_PATHS[@]}; do
    rm -rf $LINK_PATH
  done
}

function link {
  for DOTFILE_PATH in ${!CONFIG_PATHS[@]}; do
    ln -s "$DOTFILE_PATH" "${CONFIG_PATHS[$DOTFILE_PATH]}"
  done
}

case $1 in
  "remove")
    printf "$YELLOW[REMOVE]$RESET Remove all configurations...\n"
    remove
    printf "$YELLOW[REMOVE]$RESET Done.\n"
    ;;

  "link")
    printf "$GREEN[LINK]$RESET Link all configurations...\n"
    link
    printf "$GREEN[LINK]$RESET Done.\n"
    ;;

  *)
    printf "$RED[INVALID]$RESET Wrong command!\n"
  ;;
esac
