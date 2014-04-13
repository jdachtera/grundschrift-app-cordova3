#!/bin/bash

platforms=$(echo $CORDOVA_PLATFORMS | tr "," "\n")

for platform in $platforms
do
    if [ -d ./config/$platform ]; then
        echo "Copying custom $platform files";
        cp -R ./config/$platform/* ./platforms/$platform/
    fi
done