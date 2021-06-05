#!/bin/bash

dir=$(pwd)
cd mkdocs-instances

for l in en zh-Hans
do
    cd $l
    mkdocs build -d $dir/$1/ --dirty
    cd ..
done

cd root
mkdocs build -d $dir/$1/ --dirty
cd ..