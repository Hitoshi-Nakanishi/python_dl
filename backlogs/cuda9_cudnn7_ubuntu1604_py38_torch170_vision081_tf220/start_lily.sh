# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 8390:8888 -p 8290:6006 \
       --name hitoshi_py38_92 \
       -it hitoshi/python-dl:9.2-ubuntu18.04-F22T17
