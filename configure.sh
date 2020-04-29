#!/usr/local/bin/bash

source ./installation/constants.sh

function backup {
  for DOTFILE_PATH in ${!CONFIG_PATHS[@]}; do
    mv $DOTFILE_PATH ${DOTFILE_PATH}_backup
  done
}

function rollback {
  for DOTFILE_PATH in ${!CONFIG_PATHS[@]}; do
    if [ ! -f ${DOTFILE_PATH}_backup ] || [ ! -d ${DOTFILE_PATH}_backup ]; then
      mv ${DOTFILE_PATH}_backup $path
      rm -rf ${DOTFILE_PATH}_backup
    fi
  done
}

function remove {
  for DOTFILE_PATH in ${!CONFIG_PATHS[@]}; do
    rm -rf $DOTFILE_PATH
  done
}

function link {
  for DOTFILE_PATH in ${!CONFIG_PATHS[@]}; do
    link $DOTFILE_PATH ${CONFIG_PATHS[$DOTFILE_PATH]}
  done
}

case $1 in
  "backup")
    printf "$GREEN[BACKUP]$RESET Backup all configurations..."
    backup
    printf "$GREEN[BACKUP]$RESET Done."
    ;;

  "rollback")
    printf "$GREEN[ROLLBACK]$RESET Rollback all configurations..."
    rollback
    printf "$GREEN[ROLLBACK]$RESET Done."
    ;;

  "remove")
    printf "$YELLOW[REMOVE]$RESET Remove all configurations..."
    remove
    printf "$YELLOW[REMOVE]$RESET Done."
    ;;

  "link")
    printf "$GREEN[LINK]$RESET Link all configurations..."
    link
    printf "$GREEN[LINK]$RESET Done."
    ;;

  *)
    printf "$RED[INVALID]$RESET Wrong command!"
  ;;
esac