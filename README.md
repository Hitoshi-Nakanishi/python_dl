# python_dl: simple docker image for deep learning

docker link
```
1. https://hub.docker.com/repository/docker/x37n/python_dl/general
2. (automated build) https://hub.docker.com/repository/docker/x37n/python_dl/general
```

- This dockerfile aims to zsh, load anaconda, python, tensorflow, pytorch, several statistical library, and jupyterlab.
- From this repository, dockerHub automatically build latest image. Current latest file is built under the versions below
    - os: ubuntu 18.04
    - cuda: 10.1
    - cudnn7-devel
    - PyTorch: 1.7.0
    - torchvision: 0.8.1
    - tensorflow-gpu: 2.X

1. Build docker image based on Dockerfile. You can edit docker image name in this file.
```shell
./build
```
or you can create image manually.
```shell
docker build -t "docker_image_name" .
```

2. Create docker container based on the created docker image
- Please set your docker image name and container name inside docker_start.sh file.
- This shell scripts mount volume into docker container. Basically data should be saved outside of docker image, and you may connect some volume.
```shell
start.sh
```

In container, it calls zsh as default. You can open juputerlab by
```shell
jupyter lab --ip=0.0.0.0 --port=8888 --allow-root
```

and you can see the logs at tensorboard by
```shell
tensorboard --logdir=<your logging directory>
```

3. Once you generated docker image, you can save it to share different servers.
```shell
docker save hitoshi/python-dl:10.1-ubuntu18.04-F22T17-v2 > hitoshi_python_dl_101_ubuntu1804_F22T17_v2.tar
```
From tar file, you can load it without rebuilding.
```shell
docker load < hitoshi_python_dl_101_ubuntu1804_F22T17_v2.tar
```
You can rename image tag by the following command line.
```shell
docker image tag hitoshi/python-dl:10.1-ubuntu18.04-F22T17 hitoshi/python-dl:10.1-ubuntu18.04-F22T17-v2
```


# docker commands
to update image(hitoshi/allinone:latest) from container (hitoshi_all)
```bash
docker commit hitoshi_all hitoshi/allinone:latest
```



You can also see backlogs for old Dockerfiles. Good Luck :wink:
