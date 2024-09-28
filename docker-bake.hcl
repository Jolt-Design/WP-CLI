variable "platforms" {
  default = ["linux/amd64", "linux/arm64"]
}

variable "versions" {
  default = [
    "7.4",
    "8.0",
    "8.1",
    "8.2",
  ]
}

group "default" {
  targets = ["wp-cli"]
}

target "wp-cli" {
  name = "wp-cli-${replace(version, ".", "-")}"
  context = "build"

  matrix = {
    version = versions
  }

  args = {
    PHP_VERSION = version
  }

  platforms = platforms
  tags = ["joltdesign/wp-cli:${version}"]
}
