#!/bin/bash

help_text="\n\tclone-git-ssh [git-clone opts] <repository>\n\n\tUse ssh instead of http(s) for git remote operationos.\n\tClones repository into nested directory of user_name/repo_name."
print_help() {
    echo $1
    echo
    echo -e $help_text
}

last="${@: -1}"
init_count=$(( $# - 1 ))
init=${@: 1:$init_count}

url=${last}
[ -z "$url" ] && print_help "Provide github repo url" && exit 1

#accepts /blob/commit/path/to/somewhere at the end
gh_re='^https?://github.com/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)(/.*)?$'

repo=`echo $url | sed -rne "\|${gh_re}|s|${gh_re}|\1/\2|p"`
[ -z "$repo" ] && print_help "Invalid github repo url" && exit 1

url_ssh="git@github.com:${repo}"

echo git clone ${init} ${url_ssh} ${repo}
#git clone ${init} ${url_ssh} ${repo}

