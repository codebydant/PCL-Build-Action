#!/bin/sh -l
set -e

sh -c "echo $INPUT_BUILD_FLAGS"
# cmake -B `pwd`/build -DCMAKE_BUILD_TYPE=$INPUT_BUILD_TYPE -DBUILD_TESTING=$INPUT_BUILD_TESTS -DCODE_COVERAGE=$INPUT_BUILD_COVERAGE
cmake -B `pwd`/build $INPUT_BUILD_FLAGS

# cmake --build `pwd`/build --parallel $(nproc) --config -DCMAKE_BUILD_TYPE=$INPUT_BUILD_TYPE
make -j$(nproc) -C build/ --no-print-directory

if $INPUT_BUILD_TESTS; then
  # make test -C build/ --no-print-directory
  ctest --output-on-failure --test-dir build
fi

if $INPUT_BUILD_COVERAGE; then
  # make coverage -j$(nproc) -C build/
  lcov --capture --directory build/ --output-file coverage.info --quiet
  lcov --remove coverage.info '*/external/include/*' --output-file coverage.info --quiet
  lcov --remove coverage.info '/usr/*' --output-file coverage.info --quiet
  lcov --list coverage.info
fi