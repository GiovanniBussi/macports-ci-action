#! /bin/bash
env

dir="$(mktemp -d)"
cd "$dir"
curl -LO https://raw.githubusercontent.com/GiovanniBussi/macports-ci/master/macports-ci
cd -
arg=""

test -n "$INPUT_PREFIX" && arg="--prefix=$INPUT_PREFIX"
test -n "$INPUT_SOURCE" && arg="--source"
source "$dir/macports-ci" install $arg

if test -n "$INPUT_LOCALPORTS"; then
    source "$dir/macports-ci" localports "$INPUT_LOCALPORTS"
fi
