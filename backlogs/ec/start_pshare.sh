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
       --runtime=nvidia \
       -p 8529:8888 -p 8629:6006 \
       -e LUID=$(id -u $USER) -e LGID=$(id -g $USER) \
       --name hitoshi_ec \
       -it hitoshi/ec:latest

# -u $(id -u $USER):$(id -g $USER) \
