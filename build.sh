#!/bin/bash

# caminho do clang
CLANG_DIR=$HOME/clang

# variáveis
export ARCH=arm64
export SUBARCH=arm64

# toolchain
export PATH=$CLANG_DIR/bin:$PATH

# pasta de saída
OUT=out
mkdir -p $OUT

echo "Carregando r8s_defconfig..."

make O=$OUT ARCH=arm64 CC=clang LLVM=1 LLVM_IAS=1 r8s_defconfig

echo "Compilando kernel..."

make -j$(nproc) \
O=$OUT \
ARCH=arm64 \
CC=clang \
LLVM=1 \
LLVM_IAS=1

echo "Build finalizado"
