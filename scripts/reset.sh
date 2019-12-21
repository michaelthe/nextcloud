#!/usr/bin/env bash
set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "${DIR}/.."

docker-compose down

docker system prune --volumes

docker-compose up -d

docker-compose logs -f

popd
