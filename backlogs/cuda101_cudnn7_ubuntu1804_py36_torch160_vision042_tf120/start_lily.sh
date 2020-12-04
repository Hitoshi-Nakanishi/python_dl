# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 16984:8888 -p 12984:6006 \
       --name hitoshi_container2 \
       -it hitoshi/python-gpu-build:latest
