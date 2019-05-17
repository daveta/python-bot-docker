#!/bin/bash
# Determine if we are running on Windows
set -e
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    docker="docker.exe"
else
    docker="sudo docker"
fi

error_msg="Run the command from 13.core-bot directory.  Ie, \"13.core-bot> bash ./scripts/build_docker.sh\""

$docker build --rm -t local/core_bot -f docker/ubuntu/Dockerfile .
echo "Complete!"