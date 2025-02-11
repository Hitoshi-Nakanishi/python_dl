# docker create jupyter notebook on tensorflow python3 and jupyter
# any environment set up under /root/, root user is more preferable than syncing local user:group
# instead, local user:group is saved as environment variable.
# permission of any files root created will be changed by
# ``` chmod -R 774 dir_name && chown -R $(LUID):$(LGID) dir_name ```

user_drive=/mnt/c/Users/hitos
data_drive=/mnt/d
log_dir=$data_drive/log
IMAGE_TAG="mytorch:2.6.0-cuda12.6-cudnn9-runtime"
# export DISPLAY=127.0.0.1:0.0
mkdir -p $log_dir

docker run \
  -v $user_drive:/notebooks/DockerShared \
  -v $data_drive:/notebooks/DockerShared4 \
  -v $log_dir:/root/log \
  -v /dev/shm:/dev/shm \
  -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e LUID=$(id -u $USER) -e LGID=$(id -g $USER) \
  --device /dev/dri \
  --gpus 'all,"capabilities=compute,utility,graphics"' \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e __GLX_VENDOR_LIBRARY_NAME=nvidia \
  -e __NV_PRIME_RENDER_OFFLOAD=1 \
  --network host \
  -p 8888:8888 \
  -p 6006:6006 \
  -p 5000:5000 \
  -p 8080:8080 \
  --name $1 \
  -it $IMAGE_TAG \
  zsh

# -e DISPLAY=$DISPLAY \

# -u $(id -u $USER):$(id -g $USER) \
