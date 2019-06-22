#!/usr/bin/env bash

env |grep PATH

export LD_LIBRARYN32_PATH=$GCC8_INSTALL_ROOT/lib:$LD_LIBRARYN32_PATH
export PATH=$GCC8_INSTALL_ROOT/bin:$PATH

export CXXFLAGS="-g -O0"

g++ --std=c++98 -o throw_test.exe throw_test.cpp
