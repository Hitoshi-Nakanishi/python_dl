DOCKERFILE='Dockerfile'
IMAGE_TAG='hitoshi/ec:latest'
docker build --rm --pull --no-cache -t "$IMAGE_TAG" -f "$DOCKERFILE" .
