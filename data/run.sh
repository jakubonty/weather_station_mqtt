#!/bin/bash
set -e

export CONFIG_PATH=/data/options.json

echo Hello!
node -v
npm -v
node /mobilealerts.js