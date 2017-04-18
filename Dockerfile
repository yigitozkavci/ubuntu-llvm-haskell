# Use official Ubuntu 14.04 image
FROM ubuntu:14.04

# Set the working directory to /app
WORKDIR /app

# Install necessary packages
RUN sudo apt-get update && apt-get -y install dialog apt-utils wget xz-utils git vim haskell-platform libncurses5-dev

# Pull LLVM-3.5 binary for Ubuntu
RUN wget http://releases.llvm.org/3.5.0/clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz

# Extract and delete the old the tar archive
RUN tar -xvf clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
RUN rm clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz

# Put binaries in llvm to /usr/local/bin, a directory that is in the path.
RUN mv clang+llvm-3.5.0-x86_64-linux-gnu llvm
RUN cp llvm/bin/* /usr/local/bin/
RUN rm -r llvm
