#!/bin/bash

cd $(dirname "$0")/mkdocs-instances

for l in en zh-Hans
do
    mkdocs build -f $l/mkdocs.yml -d $1 --dirty
done

mkdocs build -f root/mkdocs.yml -d $1 --dirty

