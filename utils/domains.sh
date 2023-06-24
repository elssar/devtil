#!/bin/bash

# Exit on error
set -e;

if ! command -v dig &> /dev/null; then
    echo "dig not found";
    exit 1;
fi

DOMAIN=$1;

if [ -z "$DOMAIN" ]; then
    echo "No domain provided";
    exit 1;
fi

STATUS=$(dig +short ns ${DOMAIN});

if [ -z "$STATUS" ]; then
    echo "Available";
else
    echo "Not available";
fi

