#! /bin/bash

docker run \
  -it \
  --rm \
  -e DISPLAY=$DISPLAY \
  --net host \
  --mount type=bind,source=$HOME/.Xauthority,target=/root/.Xauthority.copy \
  x11-test \
  /bin/bash -c " \
  cp /root/.Xauthority.copy /root/.Xauthority; \
  chown root:root /root/.Xauthority; \
  xeyes"
