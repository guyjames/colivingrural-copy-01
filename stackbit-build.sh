#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/60b2663ceee1f0001d2b27f8/webhook/build/pull > /dev/null
curl -s -X POST https://api.stackbit.com/project/60b2663ceee1f0001d2b27f8/webhook/build/ssgbuild > /dev/null
hugo
./inject-netlify-identity-widget.js public
curl -s -X POST https://api.stackbit.com/project/60b2663ceee1f0001d2b27f8/webhook/build/publish > /dev/null
