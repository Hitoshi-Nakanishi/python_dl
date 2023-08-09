DOCKERFILE='Dockerfile'
IMAGE_TAG='hitoshi/cuda11.2:2023.08.09'
docker build --rm --pull --no-cache -t "$IMAGE_TAG" -f "$DOCKERFILE" .
