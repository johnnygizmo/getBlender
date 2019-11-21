# getBlender

This is a really simple script to automate scrubbing the builder.blender.org page for the newest compile of a certain blender version, and download it to a location of your choice on your computer.

Compile to local executable with:

dart2native main.dart -o getBlender.exe

Usage 

getBlender.exe version outputLocation

e.g.

getBlender 2.82 c:\downloads\blender.zip
