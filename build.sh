#!/usr/bin/env bash

# This shell script will build openrobotics/moveit2, openrobotics/space_robot_demo and then

ORG=simualtion
IMAGE1=o3de_mars_rover
TAG=latest

VCS_REF=""
VERSION=release

# Directory where Dockerfiles are stored
DOCKER_DIR="./docker"

# Exit script with failure if build fails
set -eo pipefail

echo ""
echo "##### Building o3de_mars_rover image #####"

docker build -t $ORG/$IMAGE1:$TAG -f $DOCKER_DIR/Dockerfile \
    --build-arg VCS_REF="$VCS_REF" \
    --build-arg VERSION="$VERSION" .

echo ""
echo "##### Done! #####"


