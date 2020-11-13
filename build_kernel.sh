#!/bin/bash

export CROSS_COMPILE=~/kernel/toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android-

mkdir out

BUILD_CROSS_COMPILE=~/kernel/toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=~/kernel/toolchain/qcom-clang-8/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

#export ARCH=arm64
#make -C $(pwd) O=$(pwd)/out KCFLAGS=-mno-android a70s_swa_open_defconfig
#make -j64 -C $(pwd) O=$(pwd)/out KCFLAGS=-mno-android

make -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC="ccache $KERNEL_LLVM_BIN" CLANG_TRIPLE=$CLANG_TRIPLE a71_eur_open_defconfig
make -j64 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC="ccache $KERNEL_LLVM_BIN" CLANG_TRIPLE=$CLANG_TRIPLE

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
