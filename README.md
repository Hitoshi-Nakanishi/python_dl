# How to set up your machine learning environment using docker

1. Select the environment from the flie list under environments/ and copy the file Dockerfile_xxxxx to Dockerfile

```shell
cp -r environments/Dockerfile_xxxxx Dockerfile
```

2. Create docker image based on Dockerfile

```shell
docker build -t "docker_image_name" .
```

3. Create docker container based on the docker image

Please set your docker image name and container name inside docker_start.sh file.

```shell
start.sh
```

4. Enjoy your life

# Examples
### tensorflow 1.12.0 + pytorch (GPU) cuda 9.0

```shell
cp environments/Dockerfile_tensorflow12_and_Pytorch_GPU_py3_cu9 Dockerfile
docker build -t "37s_MLenv" .
start.sh
```