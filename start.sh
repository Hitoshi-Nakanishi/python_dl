# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 16684:8888 -p 12684:6006 \
       --name hitoshi_container \
       -it x37n/python_dl-gpu:latest
