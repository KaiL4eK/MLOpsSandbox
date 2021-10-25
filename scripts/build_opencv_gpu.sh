#!/usr/bin/env bash

if [ -z "$OPENCV_VERSION" ]; then
    echo "Initialize env first with \"source ./scripts_build/init_env.sh\""
    exit 1
fi

echo "Install OpenCV version $OPENCV_VERSION to: $INSTALL_DIR"

mkdir -p ext; cd $_

if [ ! -d "opencv" ] ; then
    git clone https://github.com/opencv/opencv.git -b $OPENCV_VERSION
fi

if [ ! -d "opencv_contrib" ] ; then
    git clone https://github.com/opencv/opencv_contrib.git -b $OPENCV_VERSION
fi

sudo apt install -y qt5-default libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev python3-dev libatlas-base-dev gfortran cmake python3.8-dev

# if [ $? -ne 0 ]; then
#     echo "Failed to download OpenCV"
#     exit 1
# fi

cd opencv; mkdir -p build; cd $_

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=$(pwd)/../../opencv_contrib/modules \
    -D WITH_IPP=ON \
    -D WITH_QT=ON \
    -D WITH_TBB=ON \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_FFMPEG=ON \
    -D BUILD_DOCS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_JAVA=OFF \
    -D WITH_OPENMP=ON \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_opencv_apps=OFF \
    -D ENABLE_PRECOMPILED_HEADERS=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D PYTHON_DEFAULT_EXECUTABLE=$(which python3.8) \
    -D PYTHON_EXECUTABLE=$(which python3.8) \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D PYTHON3_LIBRARY=/lib/x86_64-linux-gnu/libpython3.8.so \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=$(python3.8 -c "import os; import numpy as np; print(os.path.dirname(np.__file__))")/core/include \
    -D WITH_CUDA=ON \
    -D CUDA_ARCH_BIN=$CUDA_ARCH \
    -D ENABLE_FAST_MATH=ON \
    -D CUDA_FAST_MATH=ON \
    -D WITH_CUBLAS=ON \
    -D BUILD_opencv_cudacodec=OFF \
    -D WITH_CUDNN=ON \
    -D CUDNN_LIBRARY=/lib/x86_64-linux-gnu/libcudnn.so.8 \
    -D OPENCV_DNN_CUDA=ON \
    .. && \
cmake --build . --target install --parallel `nproc --all`
