#!/usr/bin/env bash

env |grep PATH

export ORIG_PATH=$PATH

export CXXFLAGS="-g -O0"

export LD_LIBRARYN32_PATH=$GCC4_INSTALL_ROOT/lib:$LD_LIBRARYN32_PATH
export PATH=$GCC4_INSTALL_ROOT/bin:$ORIG_PATH

g++ --std=c++98 -o throw_test_4.exe throw_test.cpp

export LD_LIBRARYN32_PATH=$GCC8_INSTALL_ROOT/lib:$LD_LIBRARYN32_PATH
export PATH=$GCC8_INSTALL_ROOT/bin:$ORIG_PATH

g++ --std=c++98 -o throw_test_8.exe throw_test.cpp
