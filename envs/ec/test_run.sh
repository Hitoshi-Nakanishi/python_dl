docker run -it --rm --entrypoint bash nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
dpkg -l | grep libcublas10

https://github.com/NVIDIA/nvidia-docker/issues/1143

