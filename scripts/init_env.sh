# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# echo "SCRIPT_DIR: $SCRIPT_DIR"

# Installation directory
export INSTALL_DIR=$PWD/dist

export PATH=$INSTALL_DIR/bin:/usr/local/cuda/bin:$PATH
export CMAKE_PREFIX_PATH=$INSTALL_DIR/lib/cmake:$CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=$INSTALL_DIR/share/cmake:$CMAKE_PREFIX_PATH
export LD_LIBRARY_PATH=$INSTALL_DIR/lib:$LD_LIBRARY_PATH

# export PYTHONPATH=$INSTALL_DIR/lib/python3.8/site-packages:$PYTHONPATH
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/targets/x86_64-linux/lib

# source $PWD/dist/bin/setup_vars_opencv4.sh

export OPEN3D_VERSION=v0.13.0
export OPENCV_VERSION=4.6.0
export CMAKE_VERSION=v3.21.3
# Set this from get_compute_arch.sh script
export CUDA_ARCH=6.1
