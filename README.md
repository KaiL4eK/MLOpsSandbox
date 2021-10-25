# MLOpsSandbox

## Contents

- [CVAT](cvat) - Data labeling system with roles (management) and auto/semiauto-labeling
- [MLFLow](mlflow) - Experiment tracking (logging) system with model registry support
- [scripts](scripts) - directory with scripts for libraries compilation

    ```bash
    # To work with scripts initialize env first
    source ./scripts/init_env.sh
    ```

  - OpenCV

    Build OpenCV locally [with GPU](scripts/build_opencv_gpu.sh) or [CPU only](build_opencv_cpu.sh)
  - [CUDA compute capability detection scripts](cuda_get_compute_arch.sh)

    Find out your CUDA compute capability version for compilation

  - [Open3D](build_open3d.sh)

    Build Open3D point cloud processing framework for C++. For Python you can use PyPI version
