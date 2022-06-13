# cudahip
This is a small project to hipify CUDA code without overwriting the CUDA files but create new hip related files and adjust the Makefile to compile the HIP only files

## Usage

./cudahip.sh filename

* If the file has extension .cu then hipifies to a new file with same name and extension .hip.cpp and if it includes .cuh files replace with hip.h
* If the file is cuda header copy with extension hip.h
* if the file is cpp and it does include to cuh, copy the file to hip.cpp and rename .cuh to hip.h
