# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 16384:8888 -p 12384:6006 \
       --name hitoshi_container \
       -it hitoshi/python-gpu-build:latest
