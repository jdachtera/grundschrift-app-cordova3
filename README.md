# Grundschrift App Build System

This is the build system repository of the Grundschrift App

## Prerequisites

* [nodejs](http://nodejs.org/) & npm
* cordova (npm install -g cordova)

To build the project some additional files are needed:

* ./nonfree.tar.gz (The assets which are not open source licenced)
* ./overlay/android/my-release-key.keystore (The android release build key)
* ./overlay/android/ant.properties (A configuration file for the release build key)

These files can be obtained from the main developer. Additional files can be placed in the overlay directory if needed.
They are copied to the respective platforms build directory on each build.

**REMEMBER: Don't put any of the nonfree files or the private keys and passwords into the git repository! Instead add them to the .gitignore file**

Place these files at the appropriate locations. Then run:

```
./init.sh
```

## Build

After that you can build and run the project by typing

```
 cordova build PLATFORM
```

or

```
 cordova run PLATFORM
```

where PLATFORM can be "android" or "ios".

## Develop

The source files are in the ./src directory. So any code changes need to be made in that directory.
On each build the enyo project is build and minified and then copied to the ./www directory.
To test the app in the desktop browser you can run:

```
./serve.js
```

This start a webserver on port 8099 and load the app in your default browser.