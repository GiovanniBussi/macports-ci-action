#! /bin/bash

dir="$(mktemp -d)"
cd "$dir"
curl -LO https://raw.githubusercontent.com/GiovanniBussi/macports-ci/master/macports-ci
cd -
source "$dir/macports-ci" install
