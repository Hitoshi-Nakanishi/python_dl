# docker create jupyter notebook on tensorflow python3 and jupyter
nvidia-docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       -p 8390:8888 -p 8290:6006 \
       --name hitoshi_py38 \
       -it hitoshi/python-dl:10.1-ubuntu18.04-F22T17-v2
