#!/bin/bash
NAME="whatprovides"
mkdir -p $PREFIX/opt/${NAME}
cp -r db $PREFIX/opt/${NAME}
cp ${NAME} $PREFIX/bin

echo "Installation finished. execute $NAME -h for help"
