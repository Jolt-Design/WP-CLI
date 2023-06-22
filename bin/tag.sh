#!/bin/sh

. "`dirname $0`"/.env

set -- $PHP_VERSIONS

for version in "$@"; do
    echo "> Tagging image $IMAGE_NAME:$version as \"$version\" and \"$version-$SPECIFIC_TAG\"..."

    docker tag $IMAGE_NAME:$version $IMAGE_NAME:$version
    docker tag $IMAGE_NAME:$version $IMAGE_NAME:$version-$SPECIFIC_TAG
done
