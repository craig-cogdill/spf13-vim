#!/usr/bin/env bash

lnif() {
   echo "dollar1 is $1"
   echo "dollar2 is $2"
   if [ -e "$1" ]; then
      ln -sf "$1" "$2"
   fi
}

link_home_vimrc_to_spf13() {
   local source_path="$1"
   echo $source_path
   echo "Creating a symbolic link to $1/.vimrc.local"
   local target_path="$2"
   echo $target_path

   lnif "$target_path/.vimrc.local" "$source_path"
}

backup_current_vimrc() {
   echo "Dollar 1 is $1"
   if [ -e "$1" ]; then
      cp "$1" "$2/.vimrc.bak"
   else
      echo "There is no current .vimrc.local. Nothing to backup."
   fi
}

copy_current_vimrc_to_spf13() {
   echo "Dollar 1 is $1"
   echo "Dollar 2 is $2"
   if [ -e "$1" ]; then
      cp "$1" "$2/.vimrc.local"
   else
      echo "There is no current .vimrc.local. Nothing to move to spf13 repo."
   fi
}

remove_home_vimrc() {
   echo "Dollar 1 is $1"
   rm -f "$1"
}

LOCAL_VIMRC_PATH="$HOME/.vimrc.local"
PATH_TO_SPF13_REPO="$HOME/.spf13-vim-3"

backup_current_vimrc        "$LOCAL_VIMRC_PATH"
copy_current_vimrc_to_spf13 "$LOCAL_VIMRC_PATH" \
                            "$PATH_TO_SPF13_REPO"
remove_home_vimrc           "$LOCAL_VIMRC_PATH"
link_home_vimrc_to_spf13    "$LOCAL_VIMRC_PATH" \
                            "$PATH_TO_SPF13_REPO"
