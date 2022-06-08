#!/bin/sh -l
cmake -B `pwd`/build -DCMAKE_BUILD_TYPE=$INPUT_BUILD_TYPE
cmake --build `pwd`/build --parallel $(nproc) --config $INPUT_BUILD_TYPE