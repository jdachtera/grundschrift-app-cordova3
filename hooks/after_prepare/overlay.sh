#!/bin/bash

platforms=$(echo $CORDOVA_PLATFORMS | tr "," "\n")

for platform in $platforms
do
    if [ -d ./overlay/$platform ]; then
        echo "Copying $platform overlay files";
        cp -R ./overlay/$platform/* ./platforms/$platform/
    fi
done