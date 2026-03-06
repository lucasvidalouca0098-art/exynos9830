#!/bin/bash

# caminho do clang
CLANG_DIR=$HOME/clang

# variáveis
export ARCH=arm64
export SUBARCH=arm64

# adicionar clang ao PATH
export PATH=$CLANG_DIR/bin:$PATH

# ferramentas LLVM
export CC=clang
export LD=ld.lld
export AR=llvm-ar
export NM=llvm-nm
export OBJCOPY=llvm-objcopy
export OBJDUMP=llvm-objdump
export STRIP=llvm-strip

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
LD=ld.lld \
AR=llvm-ar \
NM=llvm-nm \
OBJCOPY=llvm-objcopy \
OBJDUMP=llvm-objdump \
STRIP=llvm-strip

echo "Build finalizado"
