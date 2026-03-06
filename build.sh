#!/bin/bash

# caminho do clang
CLANG_DIR=$HOME/clang

# variáveis
export ARCH=arm64
export SUBARCH=arm64

# toolchain
export PATH=$CLANG_DIR/bin:$PATH
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=aarch64-linux-android-
export CROSS_COMPILE_ARM32=arm-linux-androideabi-

# pasta de saída
OUT=out
mkdir -p $OUT

echo "Carregando r8s_defconfig..."

make O=$OUT ARCH=arm64 r8s_defconfig

echo "Compilando kernel..."

make -j$(nproc) \
O=$OUT \
ARCH=arm64 \
CC=clang \
LLVM=1 \
LLVM_IAS=1

echo "Build finalizado"
