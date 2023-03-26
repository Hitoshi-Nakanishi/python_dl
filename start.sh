# docker create jupyter notebook on tensorflow python3 and jupyter
# any environment set up under /root/, root user is more preferable than syncing local user:group
# instead, local user:group is saved as environment variable.
# permission of any files root created will be changed by
# ``` chmod -R 774 dir_name && chown -R $(LUID):$(LGID) dir_name ```

docker run \
  -v /share3/hitoshin/DockerShared:/notebooks/DockerShared \
  -v /share2/hitoshin/DockerShared:/notebooks/DockerShared2 \
  -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
  -v ~/log:/root/log \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --mount type=bind,source=$HOME/.Xauthority,target=/root/.Xauthority.copy \
  --runtime=nvidia \
  -p $1:8888 -p $2:6006 \
  -e LUID=$(id -u $USER) -e LGID=$(id -g $USER) \
  -e DISPLAY=$DISPLAY \
  --name hitoshi_allX \
  -it hitoshi/allinone:$3 \
  /bin/bash -c " \
  cp /root/.Xauthority.copy /root/.Xauthority; \
  chown root:root /root/.Xauthority;"


# -u $(id -u $USER):$(id -g $USER) \
