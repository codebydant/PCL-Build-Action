# PCL-Build-Action
An action for building CMake projects that uses Point Cloud Library (`PCL`), `VTK` and/or `QT` dependencies. 

## Description
This action uses a pre-compiled [pcl-docker-alpine](https://hub.docker.com/r/danieltobon43/pcl-docker) image with aditional developer tools for compilation. 

The `GITHUB_WORKSPACE` project is mounted into the docker container where a cmake command compiles the project in a `build/` directory.   

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
