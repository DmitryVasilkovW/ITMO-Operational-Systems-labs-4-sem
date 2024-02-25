#!/bin/bash

function show_menu() {
    clear
    echo "select action:"
    for i in {1..4}; do
        if [ $selected -eq $i ]; then
            echo "* $i. ${options[$i-1]} *"
        else
            echo "  $i. ${options[$i-1]}"
        fi
    done
}

selected=1

options=("nano" "vi" "links" "exit")

while true; do
  show_menu
  
  stty -echo
  read -s -n 3 key
  stty echo
  
  case "$key" in
      $'\x1b[A')
          if [ $selected -gt 1 ]; then
              ((selected--))
          fi
          ;;
      $'\x1b[B')
          if [ $selected -lt 4 ]; then
              ((selected++))
          fi
          ;;
      "")
          case $selected in 
            1) nano ;;
            2) vi ;;
            3) links ;;
            4) exit ;;
          esac
          ;;
  esac
done
