#!/usr/bin/env bash
set -e
set -x

if [[ -f .env ]]; then
    . .env
else
  echo "Missing .env file please copy .env.sample and fill in the variables"
  exit 0
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "${DIR}/.."

rsync --archive --progress --delete --exclude-from=.rsyncignore . "${USER}@${HOSTNAME}:~/${PROJECT}"

popd
