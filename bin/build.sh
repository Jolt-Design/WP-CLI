#!/bin/sh

. "`dirname $0`"/.env

set -- $PHP_VERSIONS

for version in "$@"; do
	BUILD_ARGS="--build-arg=PHP_VERSION=$version"

	if [ "$1" = "dev" ]; then
		BUILD_SUFFIX=-dev
		BUILD_ARGS="$BUILD_ARGS --build-arg=DEVBUILD=1"
	elif [ "$1" = "--no-cache" ] || [ "$2" = "--no-cache" ]; then
		BUILD_ARGS="$BUILD_ARGS --no-cache"
	fi

	echo "> Building for ${IMAGE_NAME}${BUILD_SUFFIX:-}:$version (build args: $BUILD_ARGS)"
	docker buildx build --platform $BUILD_PLATFORM -t ${IMAGE_NAME}${BUILD_SUFFIX:-}:$version ${BUILD_ARGS:-} $SOURCE_PATH
done
