DOCKERFILE="Dockerfile"
IMAGE_TAG="mytorch:2.6.0-cuda12.6-cudnn9-runtime"

docker build --rm --pull --no-cache -t "$IMAGE_TAG" -f "$DOCKERFILE" .
