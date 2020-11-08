# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
<<<<<<< 4cf7c9090fcd8a811280e6baa7cc92aae9f9e730
       -p 16684:8888 -p 12684:6006 \
       --name hitoshi_container \
       -it x37n/python_dl-gpu:latest
=======
       -p 8370:8888 -p 8270:6006 \
       --name hitoshi_py38 \
       -it hitoshi/python-gpu:10.1-ubuntu18.04-F22T17
>>>>>>> cuda101_cudnn7_ubuntu1804_py38_torch170_vision081_tf220
