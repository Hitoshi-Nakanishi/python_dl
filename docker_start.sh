# docker create jupyter notebook on tensorflow python3 and jupyter
docker run \
       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
       --runtime=nvidia \
       -p 16884:8888 -p 12884:6006 \
       --name x37_tf_006 \
       -it 37pttf3:9.0

# tensorflow/tensorflow:1.12.0-gpu-py3
# WORK --- x37_tf_004
#       -p 16882:8888 -p 12882:6006 \

# tensorflow/tensorflow:latest-py3-jupyter
# WORK

# 37pttf3:9.0
# x37_tf_006

# 37pttf3:dev
# ERROR
# import tensorflow as tf; sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
# InternalError: cudaGetDevice() failed. Status: CUDA driver version is insufficient for CUDA runtime version

# 37pttf3:example_code
# ERROR
# ImportError: libcublas.so.10.0: cannot open shared object file: No such file or directory

# tensorflow/tensorflow:latest-devel-gpu-py3
# ERROR
# ---> docker: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container process caused "chdir to cwd (\"/root\") set in config.json failed: permission denied": unknown.

# tensorflow/tensorflow:latest-gpu-py3
# ERROR
# docker: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container process caused "process_linux.go:402: container init caused \"process_linux.go:385: running prestart hook 1 caused \\\"error running hook: exit status 1, stdout: , stderr: exec command: [/usr/bin/nvidia-container-cli --load-kmods configure --ldconfig=@/sbin/ldconfig.real --device=all --compute --utility --require=cuda>=10.0 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=410,driver<411 --pid=7560 /raid/docker/aufs/mnt/90822298d9a2c3fd436540bad318bb2401ee48375f1bdd5b43d0868fc7d5dfc2]\\\\nnvidia-container-cli: requirement error: invalid expression\\\\n\\\"\"": unknown.

# tensorflow/tensorflow:latest-gpu-jupyter
# ERROR
# docker: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container process caused "process_linux.go:402: container init caused \"process_linux.go:385: running prestart hook 1 caused \\\"error running hook: exit status 1, stdout: , stderr: exec command: [/usr/bin/nvidia-container-cli --load-kmods configure --ldconfig=@/sbin/ldconfig.real --device=all --compute --utility --require=cuda>=10.0 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=410,driver<411 --pid=30080 /raid/docker/aufs/mnt/0ac65afd160f52a44d27be5290bac271b5cf5da9947bfc478185b030bd7ea379]\\\\nnvidia-container-cli: requirement error: invalid expression\\\\n\\\"\"": unknown.


# tensorflow/tensorflow:nightly-gpu-py3-jupyter
# docker run -u $(id -u):$(id -g) \
#       -v /share2/hitoshin/DockerShared:/notebooks/DockerShared \
#       --runtime=nvidia \
#       -p 16882:8888 -p 12882:6006 \
#       --name x37_tf_005 \
#       -it tensorflow/tensorflow:nightly-gpu-py3-jupyter
