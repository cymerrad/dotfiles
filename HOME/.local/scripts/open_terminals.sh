#!/usr/bin/zsh
set -e

_hack_flag=/tmp/i_suck_at_computers
_project=$(cat $_hack_flag || true)
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
    rm -f $_hack_flag
}

if [ ! -e $_hack_flag ]; then
    rm -f $_log
    echo "no_flag $@" >> $_log
    _project=${1}
    echo $_project > $_hack_flag
    _entry
else
    echo "else_args $@" >> $_log
    $1
fi

#if [ -z "$@" ]; then
#    echo "args_zero $@" >> $_log
#    _entry
#else
#    echo "else_args $@" >> $_log
#    $1
#fi

