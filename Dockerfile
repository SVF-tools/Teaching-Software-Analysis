FROM ubuntu:20.04

# Stop ubuntu-20 interactive options.
ENV DEBIAN_FRONTEND noninteractive

# Stop script if any individual command fails.
RUN set -e

# Define LLVM version.
ENV llvm_version=12.0.0

# Define home directory
ENV HOME=/home/SVF-tools

# Define dependencies.
ENV lib_deps="cmake g++-8 gcc-8 libtinfo-dev libz-dev zip"
ENV build_deps="gdb"

# Fetch dependencies.
RUN apt-get update
RUN apt-get install -y $build_deps $lib_deps

# Fetch and build SVF source.
RUN echo "Downloading LLVM and building SVF to " ${HOME}
WORKDIR ${HOME}
RUN git clone "https://github.com/SVF-tools/SVF.git"
WORKDIR ${HOME}/SVF
RUN echo "Building SVF ..."
RUN bash ./build.sh 

# Export SVF and llvm paths
ENV PATH=${HOME}/SVF/Release-build/bin:$PATH
ENV PATH=${HOME}/SVF/llvm-$llvm_version.obj/bin:$PATH
ENV SVF_DIR=${HOME}/SVF
ENV LLVM_DIR=${HOME}/SVF/llvm-$llvm_version.obj
ENV Z3_DIR=${HOME}/SVF/z3.obj

# Fetch and build SVF-Teaching example.
WORKDIR ${HOME}
RUN git clone "https://github.com/SVF-tools/SVF-Teaching.git"
WORKDIR ${HOME}/SVF-Teaching
RUN echo "Building SVF-Teaching example ..."
RUN cmake -DCMAKE_BUILD_TYPE=Release .
RUN make
