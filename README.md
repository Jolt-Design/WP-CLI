# Jolt Docker WP CLI

Source repository for the [joltdesign/wp-cli](repo) image.

A modified version of the [WP-CLI image](upstream).

## Usage

Add the following to your docker-compose.yml and replace "8.0" with the PHP version you need.

```yml
services:
  # ...
  wp_cli:
    image: joltdesign/wp-cli:8.0
  # ...
```

## Building

Run `yarn install` the first time you clone the repo.

To build a new version of this image, make your changes in `build` then run `yarn deploy`. Your Docker Hub account must be added as a collaborator on the [Docker Hub repo](repo) to be able to deploy the changes and you must have run `docker login` first.

[repo]: https://hub.docker.com/r/joltdesign/wp-cli
[upstream]: https://hub.docker.com/_/wordpress/
