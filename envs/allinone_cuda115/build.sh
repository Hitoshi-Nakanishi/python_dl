DOCKERFILE='Dockerfile'
IMAGE_TAG='hitoshi/allinone:cuda115'
docker build --rm --pull --no-cache -t "$IMAGE_TAG" -f "$DOCKERFILE" .
