if [ $# -lt 1 ] ; then
    echo "usage: bash build.sh image_name_ [version]"
    exit
fi

if [ $# -gt 1 ] ; then
    VERSION=$2
else
    VERSION=latest
fi

docker build . -t $(whoami)/$1:$VERSION
#docker build . --build-arg USER=$(whoami) --build-arg UID=$(id -u) --build-arg GROUP=$(id -g -n $(whoami)) --build-arg GID=$(id -g) -t $(whoami)/$1:$VERSION

