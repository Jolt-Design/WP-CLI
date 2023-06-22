#!/bin/sh

. "`dirname $0`"/.env

set -- $PHP_VERSIONS

for version in "$@"; do
    echo "> Pushing image to docker.io as \"$version\" and \"$version-$SPECIFIC_TAG\"..."

    docker push $IMAGE_NAME:$version
    docker push $IMAGE_NAME:$version-$SPECIFIC_TAG
done
