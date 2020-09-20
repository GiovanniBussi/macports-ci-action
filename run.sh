#! /bin/bash

dir="$(mktemp -d)"
cd "$dir"
curl -LO https://raw.githubusercontent.com/GiovanniBussi/macports-ci/master/macports-ci
cd -

arg=""
localports=""
ports=""

for opt
do
  case "$opt" in
  (prefix=?*)
     arg="$arg --prefix=${opt#prefix=}"
     ;;
  (source=source)
     arg="$arg --source"
     ;;
  (localports=?*)
     localports="${opt#localports=}"
     ;;
  (ports=?*)
     ports="${opt#ports=}"
     ;;
  esac

done

source "$dir/macports-ci" install $arg

if test -n "$localports"; then
    source "$dir/macports-ci" localports "$localports"
fi

if test -n "$ports" ; then
   sudo port install $ports
fi
