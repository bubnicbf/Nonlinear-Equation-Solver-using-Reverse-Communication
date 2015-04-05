#!/bin/bash
#
cp zero_rc.hpp /$HOME/include
#
g++ -c -I/$HOME/include RootSolver.cpp
if [ $? -ne 0 ]; then
  echo "Errors compiling RootSolver.cpp"
  exit
fi
#
mv RootSolver.o ~/libcpp/$ARCH/RootSolver.o
#
echo "Library installed as ~/libcpp/$ARCH/RootSolver.o"
