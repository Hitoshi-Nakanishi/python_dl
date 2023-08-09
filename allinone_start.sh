# docker create jupyter notebook on tensorflow python3 and jupyter
# any environment set up under /root/, root user is more preferable than syncing local user:group
# instead, local user:group is saved as environment variable.
# permission of any files root created will be changed by
# ``` chmod -R 774 dir_name && chown -R $(LUID):$(LGID) dir_name ```

docker run \
  -v /share3/hitoshin/DockerShared:/notebooks/DockerShared \
  -v /share/hitoshin/DockerShared:/notebooks/DockerShared1 \
  -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
  -v ~/log:/root/log \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --mount type=bind,source=$HOME/.Xauthority,target=/root/.Xauthority.copy \
  --runtime=nvidia \
  -e LUID=$(id -u $USER) -e LGID=$(id -g $USER) \
  -e DISPLAY=$DISPLAY \
  --device /dev/dri \
  --gpus 'all,"capabilities=compute,utility,graphics"' \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e __GLX_VENDOR_LIBRARY_NAME=nvidia \
  -e __NV_PRIME_RENDER_OFFLOAD=1 \
  --net host \
  --name hitoshi_$2 \
  -it hitoshi/allinone:$1 \
  /bin/bash -c " \
  cp /root/.Xauthority.copy /root/.Xauthority; \
  chown root:root /root/.Xauthority; \
  zsh"


# -u $(id -u $USER):$(id -g $USER) \
