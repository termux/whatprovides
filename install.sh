#!/bin/bash
NAME="whatprovides"
mkdir -p $PREFIX/share/${NAME}
cp -r db $PREFIX/share/${NAME}
cp ${NAME} $PREFIX/bin

echo "Installation finished. execute $NAME -h for help"
