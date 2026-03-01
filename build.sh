#!/bin/bash

VERSION=1.0.0
PKG=monitor-tool_$VERSION

rm -rf build
mkdir -p build/$PKG/usr/local/bin
mkdir -p build/$PKG/usr/share/applications
mkdir -p build/$PKG/DEBIAN

cp src/monitor-tool build/$PKG/usr/local/bin/
cp src/monitor-helper.sh build/$PKG/usr/local/bin/
cp packaging/monitor-tool.desktop build/$PKG/usr/share/applications/
cp packaging/DEBIAN/control build/$PKG/DEBIAN/

chmod 755 build/$PKG/usr/local/bin/*
chmod 644 build/$PKG/usr/share/applications/*
chmod 644 build/$PKG/DEBIAN/control

find build/$PKG -type d -exec chmod 755 {} \;

dpkg-deb --build --root-owner-group build/$PKG

echo "Build complete."