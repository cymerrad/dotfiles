#!/bin/bash

url=$1
[ -z "$url" ] && echo "Provide github repo url" && exit 1

#accepts /blob/commit/path/to/somewhere at the end
gh_re='^https?://github.com/(\w+)/(\w+)/?.*$'

repo=`echo $url | sed -rne "\|${gh_re}|s|${gh_re}|\1/\2|p"`
[ -z "$repo" ] && echo "Invalid github repo url" && exit 1

url_ssh="git@github.com:${repo}"

echo git clone ${url_ssh} ${repo}
git clone ${url_ssh} ${repo}

