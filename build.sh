#!/bin/bash

# Install a release doxygen
conan install -if doxygen doxygen/1.9.1@ --build missing -o doxygen:enable_search=False

# Export pkg-a, which build_requires doxygen
conan export pkg-a

# Build pkg-b in debug.
# This _should_ use the release doxygen, but finds two doxygens instead and then
# gives an error about a missing folder.

conan install pkg-b -if build -s build_type=Debug --build missing
