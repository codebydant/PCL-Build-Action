# CMake Flags feature
This branch is for running the PCL-Build-Action with CMake flags.

## Usage

```
steps:
  - name: Clone Repository
    uses: actions/checkout@v3

  - name: Build with Clang compiler
    uses: danielTobon43/PCL-Build-Action@feat-cmake-flags
    with:
      build_flags: >
        -DCMAKE_BUILD_TYPE=Release 
        -DCMAKE_C_COMPILER=clang 
        -DCMAKE_CXX_COMPILER=clang++
```