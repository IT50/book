#!/bin/bash

PROJECT_ROOT=$(dirname $0)

for l in en zh-Hans
do
    mkdocs build -f $PROJECT_ROOT/mkdocs-instances/$l/mkdocs.yml -d ../../../$1 --dirty
done

mkdocs build -f $PROJECT_ROOT/mkdocs-instances/root/mkdocs.yml -d ../../../$1 --dirty

