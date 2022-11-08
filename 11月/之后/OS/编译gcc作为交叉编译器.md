对于不同架构的机器有不同平台下的GCC进行C语言的编译，Linux上自带的GCC的架构时x86架构的,这里我们构建i686-elf-gcc,i686是更为简洁的精简指令集，正是我们所需要的。推荐从源码进行构建，包括了源码的下载，配置和编译，可以使用本项目提供的自动化脚本，这将包含gcc和binutils源码的下载，配置和编译]

home下的目录结构，这里的cross-compiler和toolchain是我们新建的,其中cross-compiler应该是经过编译后的i686-elf-gcc的存放位置,toolchain

![image-20221108143250574](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221108143250574.png)

toolchain的目录结构

![image-20221108143422495](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221108143422495.png)







```sh
sudo apt update &&\
     sudo apt install -y \
		build-essential \
		bison\
		flex\
		libgmp3-dev\
		libmpc-dev\
		libmpfr-dev\
		texinfo

BINUTIL_VERSION=2.37
BINUTIL_URL=https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz

GCC_VERSION=11.2.0
GCC_URL=https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz

GCC_SRC="gcc-${GCC_VERSION}"
BINUTIL_SRC="binutils-${BINUTIL_VERSION}"

# download gcc & binutil src code

export PREFIX="$HOME/cross-compiler"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

mkdir -p "${PREFIX}"
mkdir -p "${HOME}/toolchain/binutils-build"
mkdir -p "${HOME}/toolchain/gcc-build"

cd "${HOME}/toolchain"


# 这里开始在home/toolchain/gcc-11.2.0中下载源码压缩包wget,解压tar,删除源码压缩包rm -f
if [ ! -d "${HOME}/toolchain/${GCC_SRC}" ]
then
	(wget -O "${GCC_SRC}.tar" ${GCC_URL} \
		&& tar -xf "${GCC_SRC}.tar") || exit
	rm -f "${GCC_SRC}.tar"
else
	echo "skip downloading gcc"
fi

#这里开始在home/toolchain/binutils-2.37中下载源码并解压，删除源码压缩包
if [ ! -d "${HOME}/toolchain/${BINUTIL_SRC}" ]
then
	(wget -O "${BINUTIL_SRC}.tar" ${BINUTIL_URL} \
		&& tar -xf "${BINUTIL_SRC}.tar") || exit
	rm -f "${BINUTIL_SRC}.tar"
else
	echo "skip downloading binutils"
fi


#这里开始在toolchain/binutils-build中构建binutils

#首先在configure中调一下配置，把目标平台target修改为i685-elf,
#把prefix修改为"$HOME/cross-compiler"
#使用指令
#这里编译binultils
#(make && make install) || exit
#这里编译所有的gcc

#make all-gcc
#(make all-gcc &&\
# make all-target-libgcc &&\
# make install-gcc &&\
# make install-target-libgcc) |exit
 #开始编译,因为里面有makefile
 
 
echo "Building binutils"

cd "${HOME}/toolchain/binutils-build"

("${HOME}/toolchain/${BINUTIL_SRC}/configure" --target=$TARGET --prefix="$PREFIX" \
	--with-sysroot --disable-nls --disable-werror) || exit

(make && make install) || exit

echo "Binutils build successfully!"

echo "Building GCC"

cd "${HOME}/toolchain/gcc-build"

which -- "$TARGET-as" || echo "$TARGET-as is not in the PATH"

("${HOME}/toolchain/${GCC_SRC}/configure" --target=$TARGET --prefix="$PREFIX" \
	--disable-nls --enable-languages=c,c++ --without-headers) || exit

(make all-gcc &&\
 make all-target-libgcc &&\
 make install-gcc &&\
 make install-target-libgcc) || exit

echo "done"
```



推荐从源码构建