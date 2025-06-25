#!/bin/bash

dirname=$1
startno=$2
endno=$3

echo "use the arguments appending ./ command"

for (( i=starno; i<=endno; i++ )); do
  mkdir -p "${dirname}${i}"
done

