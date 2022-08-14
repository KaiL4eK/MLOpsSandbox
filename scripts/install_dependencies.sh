#!/usr/bin/env bash

# OpenCV
sudo apt install -y qt5-default \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    python3.8-dev libatlas-base-dev gfortran cmake \
    libx264-dev

# Open3D
sudo apt install \
    xorg-dev libglu1-mesa-dev \
    python3.8-dev libsdl2-dev \
    libc++-7-dev libc++abi-7-dev \
    ninja-build libxi-dev \
    libtbb-dev libosmesa6-dev \
    libudev-dev autoconf libtool
