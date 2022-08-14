#!/usr/bin/env bash

if [ -z "$PCL_VERSION" ]; then
    echo "Initialize env first with \"source ./scripts_build/init_env.sh\""
    exit 1
fi

INSTALL_DIR=$PWD/dist
CLONE_DIRECTORY=pcl

echo "Install version $PCL_VERSION to: $INSTALL_DIR"

mkdir -p ext; cd $_

if [ ! -d $CLONE_DIRECTORY ] ; then
    git clone --recursive https://github.com/PointCloudLibrary/pcl -b $PCL_VERSION $CLONE_DIRECTORY
    if [ $? -ne 0 ]; then
        echo "Failed to download PCL"
        exit 1
    fi
fi

cd $CLONE_DIRECTORY; mkdir -p build; cd $_

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    .. && \
cmake --build . --target install --parallel `nproc --all`
