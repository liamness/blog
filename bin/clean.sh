#!/bin/bash
set -e

# Run in container to get around permissions issues
docker-compose run node-service rm -rf public/*
