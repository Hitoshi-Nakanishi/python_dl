docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 16084:8888 -p 12084:6006 \
       --name hitoshi_container \
       -it hitoshi/python-gpu-build:latest
