#!/bin/bash

for l in en zh-Hans
do
    mkdocs build -f mkdocs-instances/$l/mkdocs.yml -d ../../$1 --dirty
done

mkdocs build -f mkdocs-instances/root/mkdocs.yml -d ../../$1 --dirty

