#!/bin/bash

if ! (type nixfmt &>/dev/null); then
  echo 'Error: command nixfmt not found!'
  exit 1
fi

read -d'EOF' -ra err < <(nixfmt "$@" 2>&1 | sed '2,4d')

loc=$(grep -oE '[0-9]+:[0-9]+'<<<"${err[0]}")
line=$(awk -F':' '{print $1}'<<<"$loc")
col=$(awk -F':' '{print $2}'<<<"$loc")

unexp=$(awk '{print $1, $2}'<<<"${err[@]:1}")

exp="${err[*]:3}"

if ! nixfmt -cq "$@"; then
  echo -n "Error: line $line, col $col: $unexp; $exp." >&2
  exit 1
else
  nixfmt -qv "$@"
fi
