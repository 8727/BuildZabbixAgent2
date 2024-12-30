#!/bin/bash

pkg_dir=$1

if [ ! -d $pkg_dir ]; then
    echo "*** Error: Directory $pkg_dir does not exist" >&2
    exit 1
fi
build_dir=$PWD
cd $PWD/$pkg_dir && tar -czvf $build_dir/$pkg_dir.tar.gz .
