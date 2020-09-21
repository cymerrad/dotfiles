#!/bin/bash

_config=~/.config/alacritty/alacritty.yml

sed -i --follow-symlinks -re '/colors: \*light/s/light/dark/ ; te ; /colors: \*dark/s/dark/light/ ; :e' ${_config}

notify-send "Alacritty theme switch"
