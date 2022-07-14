# PCL-Build-Action
An action for building CMake projects that uses Point Cloud Library (`PCL`), `VTK` and/or `QT` dependencies. 

![pcl-logo](https://pointclouds.org/assets/images/logo.png)

## Description
This action uses a pre-compiled [pcl-docker-alpine](https://hub.docker.com/r/danieltobon43/pcl-docker) image with aditional developer tools for compilation. This Action provides a Docker container environment with the installation of the Point Cloud Library (PCL), VTK, Boost, Eigen, Flann and OpenGL.

The `GITHUB_WORKSPACE` repository is mounted into the docker container where a cmake command compiles the project in a `build/` directory. After the compiling process is done, the build folder remain in the `GITHUB_WORKSPACE` repository.

**Note:**
This action assumes that the main `CMakeLists.txt` file is located at the top level (root) of the repository.

<p align="center">
  <img src="https://user-images.githubusercontent.com/35694200/178979970-8d36f51b-5ea5-4206-9aac-eeb0d914eef8.png" alt="Sublime's custom image"/>
</p>


**Docker Image installed libraries:**
|     Package      |   Version      |  Description       |
|     -----------       |   -----------      |       -----------     |
|        VTK           |    9.1.0      |  The Visualization Toolkit   |
|        PCL           |     1.12.1     |    The Point Cloud Library (PCL)  |
|        Eigen        |     3.7.7      |  Eigen is a library of template headers for linear algebra  |
|        Flann        |     1.9.1    |      Fast Library for Approximate Nearest Neighbors  |
|       Boost         |    1.77.0   | Provides support for linear algebra, pseudorandom number generation, multithreading  |
|       OpenGL   |   21.2.6   | Programming interface for rendering 2D and 3D vector graphics.  

**Docker Image compiled modules for PCL:**
```
The following subsystems were built:
--   common
--   kdtree
--   octree
--   search
--   geometry
--   io
--   visualization
--   sample_consensus
--   filters
--   2d
--   features
--   ml
--   segmentation
--   surface
--   registration
--   keypoints
--   tracking
--   recognition
--   stereo
--   apps
--   benchmarks: Disabled by default
--   outofcore
--   examples: Code examples are disabled by default.
--   people
--   simulation
--   global_tests: Disabled by default
--   tools
```

**Docker Image installed dev tools:**
|     Package      |   Version        |         Description                        |
|     -----------  |   -----------    |          -----------                       |
|   CMake          |    3.21.3        |  Software for build automation             |
|    build-base    |     0.4-r1       |    Meta package with `gcc`, `g++`, `make`  |

 

# Usage
```
steps:
    - name: Clone repository
      uses: actions/checkout@v3
      
    - name: PCL Build Action
      uses: danielTobon43/PCL-Build-Action@v1
```

## Inputs
```
steps:
    - name: Clone repository
      uses: actions/checkout@v3
      
    - name: PCL Build Action
      uses: danielTobon43/PCL-Build-Action@v1
      with:
        build_type: Release (Release, Debug, RelWithDebInfo, etc.)
```

## Customization
To provide CMake ARGS to the build process such as: `CMAKE_CXX_COMPILER`, `CMAKE_INSTALL_PREFIX`, etc. Check the [feat-cmake-flags](https://github.com/danielTobon43/PCL-Build-Action/tree/feat-cmake-flags) branch.

More information about usage, [here](https://github.com/danielTobon43/PCL-Build-Action/blob/feat-cmake-flags/README_cmakeflags.md)
