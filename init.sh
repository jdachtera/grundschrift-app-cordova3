#!/bin/bash

git submodule init
git submodule update --recursive
mkdir -p plugins
mkdir -p www
mkdir -p platforms

if [ -d ./nonfree ]
then
    cp -R ./nonfree/* ./src;
elif [ -e ./nonfree.tar.gz ]
then
    tar xzf ./nonfree.tar.gz;
    cp -R ./nonfree/* ./src;
else
    echo "Please put the file 'nonfree.tar.gz' or the extracted directory 'nonfree' into the main folder and try again";
    exit;
fi


cordova plugin add 	org.apache.cordova.camera  \
                    org.apache.cordova.device  \
                    org.apache.cordova.media   \
                    org.apache.cordova.file    \
                    org.apache.cordova.console

cordova platform add android
cordova platform add ios