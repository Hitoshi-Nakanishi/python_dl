# python_dl: simple docker image for deep learning

docker link
```
1. https://hub.docker.com/repository/docker/x37n/python_dl/general
2. (automated build) https://hub.docker.com/repository/docker/x37n/python_dl/general
```

1. Select the environment from the flie list under environments/ and copy the file Dockerfile_xxx to gpu.Dockerfile
By default, it's the latest environment for deep learning.
```shell
cp -r environments/xxxxx/Dockerfile gpu.Dockerfile
```

2. Build docker image based on Dockerfile

```shell
./build
```

or run with your specific name

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
### tensorflow 2.X + pytorch 1.5 (GPU) under ubuntu 18.04 + cuda 10.1

```shell
./build
start.sh
```
