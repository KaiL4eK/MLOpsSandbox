#!/usr/bin/env bash

if [ -z "$CMAKE_VERSION" ]; then
    echo "Initialize env first with \"source ./scripts_build/init_env.sh\""
    exit 1
fi


echo "Install version $CMAKE_VERSION to: $INSTALL_DIR"

mkdir -p ext; cd $_

if [ ! -d "CMake" ] ; then
    git clone https://github.com/Kitware/CMake.git -b $CMAKE_VERSION
    if [ $? -ne 0 ]; then
        echo "Failed to download CMake"
        exit 1
    fi
fi

cd CMake; mkdir -p build; cd $_

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    .. && \
cmake --build . --target install --parallel `nproc --all`
