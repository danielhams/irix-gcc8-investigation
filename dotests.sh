#!/usr/bin/env bash

export MBROOT=/builds/dan/bootstrapinstall

export GDB_PATH=/builds/dan/bootstrapinstall/gbs4_1/bin/gdb

export GCC4_INSTALL_ROOT=$MBROOT/gbs4_test
export GCC8_INSTALL_ROOT=$MBROOT/gbs8_test

# (1) Build executables with gcc4, gcc8

#./buildexe.sh

export ORIG_LLP=$LD_LIBRARYN32_PATH

# (2) Run against the gcc4 libs, obtain some trace
export LD_LIBRARYN32_PATH=$GCC4_INSTALL_ROOT/lib32:$ORIG_LLP
echo "------ GCC4 COMPILER, GCC4 LIBS RUN ------"
./throw_test_4.exe | tee comp4libs4.out

echo "------ GCC8 COMPILER, GCC4 LIBS RUN ------"
./throw_test_8.exe |tee comp8libs4.out

# (3) Run against the gcc8 libs, obtain same trace
export LD_LIBRARYN32_PATH=$GCC8_INSTALL_ROOT/lib32:$ORIG_LLP
echo "------ GCC4 COMPILER, GCC8 LIBS RUN ------"
./throw_test_4.exe |tee comp4libs8.out

export LD_LIBRARYN32_PATH=$GCC8_INSTALL_ROOT/lib32:$ORIG_LLP
echo "------ GCC8 COMPILER, GCC8 LIBS RUN ------"
./throw_test_8.exe |tee comp8libs8.out
