
FROM ubuntu:22.04

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
# Development files
    mingw-w64 \
    # x32 version system environment
    gcc-mingw-w64-i686 \
    gcc-multilib g++-multilib \
    libc6:i386 libstdc++6:i386 \
    #
    build-essential \
    git \
    bzip2 \
    wget && \
    apt-get clean
#
ARG CMAKE_VERSION=3.25.1
# Get Cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh
#
ENV PATH="/usr/bin/cmake/bin:${PATH}"