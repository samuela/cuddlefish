#!/usr/bin/env bash

# See https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail

# Don't source /etc/cuddlefish-dev.env here because that would break CI which
# injects these env vars on its own. Instead you'll need to export them yourself
# when running locally.

# Add --silent flag so these secrets don't end up in CI logs.
yarn --silent apollo schema:download hasura_gql/schema.json \
    --endpoint=$HASURA_GQL_ENDPOINT \
    # --header="X-Hasura-Admin-Secret: $HASURA_ACCESS_KEY"
