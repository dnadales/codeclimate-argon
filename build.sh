#!/bin/sh
set -e

docker build \
  --file Dockerfile \
  --tag codeclimate/codeclimate-argon .
