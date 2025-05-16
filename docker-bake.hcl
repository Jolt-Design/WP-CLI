variable "platforms" {
  default = ["linux/amd64", "linux/arm64"]
}

variable "versions" {
  default = [
    "8.2",
    "8.3",
    "8.4",
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
