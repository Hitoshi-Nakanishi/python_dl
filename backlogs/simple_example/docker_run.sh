docker run \
  --runtime=nvidia \
  --name $1 \
  -v /share:/share -v /share2:/share2 \
  -v /share2/kaneko/pjs:/root/pjs \
  -v ~/log:/root/log \
  -p 32773:8888 -p 32774:6006 -p 32775:22 \
  -it kaneko/$1
#-v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \

#  -v ~/pjs:/home/$(whoami)/pjs \
#  -u $(id -u):$(id -g) \
#  -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) \
#  -e LOCAL_USER=$(whoami) -e LOCAL_GROUP=$(id -g -n $(whoami))\
