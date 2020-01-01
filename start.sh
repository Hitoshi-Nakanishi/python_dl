# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 16884:8888 -p 12884:6006 \
       --name docker_container_name \
       -it docker_image_name