# docker create jupyter notebook on tensorflow python3 and jupyter
# any environment set up under /root/, root user is more preferable than syncing local user:group
# instead, local user:group is saved as environment variable.
# permission of any files root created will be changed by
# ``` chmod -R 774 dir_name && chown -R $(LUID):$(LGID) dir_name ```

docker run \
  -v /home/hitoshin:/notebooks/DockerShared \
  -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
  -v ~/log:/root/log \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --runtime=nvidia \
  -e LUID=$(id -u $USER) -e LGID=$(id -g $USER) \
  -e DISPLAY=$DISPLAY \
  --device /dev/dri \
  --gpus 'all,"capabilities=compute,utility,graphics"' \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e __GLX_VENDOR_LIBRARY_NAME=nvidia \
  -e __NV_PRIME_RENDER_OFFLOAD=1 \
  --network host \
  --name hitoshi_allX \
  -it hitoshi/allinone:$1 \
  zsh


# -u $(id -u $USER):$(id -g $USER) \
