#! /bin/bash

dir="$(mktemp -d)"
cd "$dir"
curl -LO https://raw.githubusercontent.com/GiovanniBussi/macports-ci/master/macports-ci
cd -
arg=""

test "$1" != "" && arg="$arg --prefix=$1"

test "$2" == "source" && arg="$arg --source"

source "$dir/macports-ci" install $arg

#if test -n "$INPUT_LOCALPORTS"; then
    #source "$dir/macports-ci" localports "$INPUT_LOCALPORTS"
#fi
