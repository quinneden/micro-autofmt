#!/usr/bin/env bash

read -d'EOF' -ra err < <(nixfmt "$@" 2>&1 | sed '2,4d')

loc=$(grep -oE '[0-9]+:[0-9]+' <<< "${err[0]}")
line=$(awk -F':' '{print $1}' <<<"$loc")
col=$(awk -F':' '{print $2}' <<<"$loc")

if [[ -n $err ]]; then
  (printf '%s' "Error: line $line, column $col: "; printf '%s %s, %s %s\n' "${err[@]:1}") >&2
  exit 1
else
  nixfmt -qv "$@"
fi
