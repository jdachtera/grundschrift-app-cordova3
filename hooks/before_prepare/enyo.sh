#!/bin/sh
# Compiles the enyo sources in ../src to the ../www directory
cd $1/src
./tools/deploy.sh -o ../www
cp ./main.html ../www