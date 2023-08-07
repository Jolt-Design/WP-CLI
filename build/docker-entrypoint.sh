#!/bin/sh
set -euo pipefail

prepend_file_path=/usr/local/etc/php/conf.d/00-auto_prepend_file.ini

# If we have a prepend file set as an env var, set that up
if [ "x${AUTO_PREPEND_FILE}" != "x" ]; then
    echo "auto_prepend_file=\"$AUTO_PREPEND_FILE\"" > $prepend_file_path
fi

### Upstream entrypoint from this point onwards...

# first arg is `-f` or `--some-option`
# or if our command is a valid wp-cli subcommand, let's invoke it through wp-cli instead
# (this allows for "docker run wordpress:cli help", etc)
if [ "${1#-}" != "$1" ] || wp help "$1" > /dev/null 2>&1; then
    set -- wp "$@"
fi

exec "$@"
