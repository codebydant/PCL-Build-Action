# Testing feature
This branch is for running the PCL-Build-Action with CMake projects that uses BUILD_TESTING, COVERAGE reports. e.g.

```
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprofile-arcs -ftest-coverage")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")

if(BUILD_TESTING)
    message("${BoldWhite} Testing enabled ${ColourReset}")
    enable_testing()
    add_subdirectory(external)
    add_subdirectory(tests)
    if(CODE_COVERAGE)
        message("${BoldWhite} Coverage enabled ${ColourReset}")        
        include("${CMAKE_CURRENT_LIST_DIR}/cmake/CodeCoverage.cmake")
        append_coverage_compiler_flags()
        setup_target_for_coverage_lcov(NAME coverage EXECUTABLE testlib BASE_DIRECTORY ../coverage)
    endif()
endif()
```

## Coverage cmake module

[https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake](https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake)

## Dependencies
For Alpine Linux:

- `sudo apk add lcov --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing`

## Compiling

```
cmake .. -DCODE_COVERAGE=ON -DBUILD_TESTING=ON -DCMAKE_BUILD_TYPE=Debug
make test
make test -C build/
make coverage
```

## LCOV report
```
- lcov --capture --directory . --output-file coverage.info --quiet
- lcov --remove coverage.info '/usr/*' --output-file coverage.info --quiet
- lcov --remove coverage.info '*/external/include/catch2/*' --output-file coverage.info --quiet
- lcov --list coverage.info

Reading tracefile coverage.info
                                          |Lines       |Functions  |Branches    
Filename                                  |Rate     Num|Rate    Num|Rate     Num
================================================================================
[/home/pcluser/project/]
parser/include/modern/concrete_parses.hpp | 0.0%      5| 0.0%     1|    -      0
parser/parser.cpp                         |72.7%     11| 100%     3|    -      0
tests/test_parser.cpp                     | 100%     10| 100%     1|    -      0
================================================================================
                                    Total:|69.2%     26|80.0%     5|    -      0
```

## ctest
This is compatible with ctest

# Usage
```
steps:
    - name: Clone Repository
      uses: actions/checkout@v3
    
    - name: Build, Test and Coverage
      uses: danielTobon43/PCL-Build-Action@testing
      with:
        build_tests: true
        build_coverage: true
```

## LCOV Coverage Checker
https://github.com/marketplace/actions/lcov-minimum-test-coverage-checker
```
- name: LCOV Minimum Coverage Checker
  uses: terencetcf/github-actions-lcov-minimum-coverage-checker@v1
  with:
    coverage-file: coverage.info
```

## Lint clang-formatting
https://github.com/marketplace/actions/clang-format-check
```
lint:
    name: Formatting Check
    runs-on: ubuntu-20.04

    steps:
      - uses: actions/checkout@v2
      - name: Run clang-format style check for C/C++/Protobuf programs.
        uses: jidicula/clang-format-action@v4.5.0
        with:
          clang-format-version: "10"
          check-path: "."
          exclude-regex: "external"
```
