#!/usr/bin/env bash

export MBROOT=/builds/dan/bootstrapinstall

export GDB_PATH=/builds/dan/bootstrapinstall/gbs4_1/bin/gdb

export GCC4_INSTALL_ROOT=$MBROOT/gbs4_test
#export GCC8_INSTALL_ROOT=$MBROOT/gbs8_test
export GCC8_INSTALL_ROOT=$MBROOT/gbs8_1

# (1) Build the executable with gcc8

./buildexe.sh

export ORIG_LLP=$LD_LIBRARYN32_PATH

# (2) Run it against the gcc4 libs, obtain some trace
export LD_LIBRARYN32_PATH=$GCC4_INSTALL_ROOT/lib:$ORIG_LLP
echo "------ GCC4 RUN ------"
./throw_test.exe
#$GDB_PATH -r ./throw_test.exe

# (3) Run it against the gcc8 libs, obtain same trace
export LD_LIBRARYN32_PATH=$GCC8_INSTALL_ROOT/lib:$ORIG_LLP
echo "------ GCC8 RUN ------"
./throw_test.exe
#$GDB_PATH ./throw_test.exe
