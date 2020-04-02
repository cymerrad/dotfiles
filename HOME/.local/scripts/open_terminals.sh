#!/usr/bin/zsh
set -e

_project=~/Projects/cryptonomicon
_script_location=`realpath $0`
_log=/tmp/rec_sh.log

_term_run() {
    echo "term_run $@" >> $_log
    i3-msg "exec alacritty --working-directory $1 --hold --command zsh -c '$2 $3 && zsh'" 
}

_entry() {
    echo "entry $@" >> $_log
    _term_run $_project $_script_location _left 
}

_left() {
    echo "left $@" >> $_log
    _term_run $_project $_script_location _top_right
}

_top_right() {
    echo "top_right $@" >> $_log
    i3-msg "split toggle"
    _term_run $_project $_script_location _bottom_right
}

_bottom_right() {
    echo "bottom_right $@" >> $_log
    i3-msg "split toggle"
    echo "Done."
}

if [ -z "$@" ]; then
    echo "args_zero $@" >> $_log
    _entry
else
    echo "else_args $@" >> $_log
    $1
fi

