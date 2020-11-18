#!/bin/bash
mkdir -p $PREFIX/opt/termux-provides
cp -r db $PREFIX/opt/termux-provides
cp termux-provides  $PREFIX/bin

echo "Installation finished. execute termux-provides -h for help"
