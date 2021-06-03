DOCKERFILE='Dockerfile'
IMAGE_TAG='hitoshi/allinone:latest'
docker build --rm --pull --no-cache -t "$IMAGE_TAG" -f "$DOCKERFILE" .
