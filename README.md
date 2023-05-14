# python_dl: simple docker image for deep learning

docker link
```
1. https://hub.docker.com/repository/docker/x37n/python_dl/general
2. (automated build) https://hub.docker.com/repository/docker/x37n/python_dl/general
```

- This dockerfile aims to zsh, load anaconda, python, tensorflow, pytorch, several statistical library, and jupyterlab.
- From this repository, dockerHub automatically build latest image. Current latest file is built under the versions below
    - os: ubuntu XX.04
    - cuda, cudnn*-devel
    - PyTorch, TorchVision
    - Tensorflow
    - Jax / Flax

1. Build docker image based on Dockerfile. You can edit docker image name in this file.
```shell
bash build.sh
```

2. Create docker container based on the created docker image
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
docker save hitoshi/cuda11.2:2023.05.04 > 20230504_cuda112.tar
```
From tar file, you can load it without rebuilding.
```shell
docker load < 20230504_cuda112.tar
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
