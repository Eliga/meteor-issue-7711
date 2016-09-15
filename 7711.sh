#!/bin/bash

meteor create issue-7711
cd issue-7711
mkdir packages
cd packages
meteor create --package my:pack
ls 
# 'pack' directory created instead of my:pack
mv pack my:pack
cd my:pack
> pack.js
echo "Npm.depends({'fs-extra':'0.30.0'})" >> package.js
cd ../..
meteor add my:pack
# crash
ls packages
# wrong directory created with .npm, create good one :
mkdir packages/my:pack/.npm
meteor add my:pack
# works fine ...
cd ..
rm -rf issue-7711

