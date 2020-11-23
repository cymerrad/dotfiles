#!/bin/bash
# Small script to set display into standby, suspend or off mode
# 20060301-Joffer
sleep 1
case $1 in
    standby|suspend|off)
        xset dpms force $1
    ;;
    *)
        echo "Usage: $0 standby|suspend|off"
    ;;
  esac
