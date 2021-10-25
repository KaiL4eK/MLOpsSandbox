#!/usr/bin/env bash

if [ -z "$OPEN3D_VERSION" ]; then
    echo "Initialize env first with \"source ./scripts_build/init_env.sh\""
    exit 1
fi

echo "Install Open3D version $OPEN3D_VERSION to: $INSTALL_DIR"

mkdir -p ext; cd $_

if [ ! -d "Open3D" ] ; then
    git clone --recursive https://github.com/isl-org/Open3D -b $OPEN3D_VERSION
    if [ $? -ne 0 ]; then
        echo "Failed to download Open3D"
        exit 1
    fi
fi

cd Open3D; mkdir -p build; cd $_

sudo apt install \
    xorg-dev libglu1-mesa-dev \
    python3-dev libsdl2-dev \
    libc++-7-dev libc++abi-7-dev \
    ninja-build libxi-dev \
    libtbb-dev libosmesa6-dev \
    libudev-dev autoconf libtool

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    -D BUILD_CUDA_MODULE=ON \
    .. && \
cmake --build . --target install --target python-package --parallel `nproc --all`

    # -D BUILD_JUPYTER_EXTENSION=ON \
