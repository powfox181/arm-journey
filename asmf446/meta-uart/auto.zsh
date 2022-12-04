#!/bin/zsh
cmake -GNinja -Bbuild-metal
ninja -Cbuild-metal
arm-none-eabi-gdb -x gdbinit /media/psf/stm/asmf446/meta-uart/build-metal/meta-uart-obj
