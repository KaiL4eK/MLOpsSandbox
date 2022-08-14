#!/usr/bin/env bash

ARCHIVE_NAME="libtorch-cxx11-abi-shared-with-deps-1.10.0+cu113.zip"
INSTALL_DIR=$PWD/dist

mkdir -p ext; cd $_

wget https://download.pytorch.org/libtorch/cu113/libtorch-cxx11-abi-shared-with-deps-1.10.0%2Bcu113.zip -O $ARCHIVE_NAME && \
unzip $ARCHIVE_NAME && \
cp -r libtorch/* $INSTALL_DIR
