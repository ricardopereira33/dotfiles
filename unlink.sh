#!/bin/sh

if [ "$#" -ne 3 ]; then
  printf "$ORANGE[WARN]$RESET Remove current configuration without backup.\n"
  exit 1
fi


echo $paths

function backup {
  for path in $paths; do
    mv $path $path_backup
  done
}

function rollback {
  for path in $paths; do
    if [ ! -f $path_backup ] || [ ! -d $path_backup ]; then
      mv $path_backup $path
      rm -rf $path_backup
    fi
  done
}

function remove {
  for path in $paths; do
    rm -rf $path
  done
}




