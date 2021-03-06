# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared2 \
       -v /share3/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 8329:8888 -p 8229:6006 \
       --name hitoshi_py38 \
       -it hitoshi/python-dl:10.1-ubuntu18.04-F22T17-v2
