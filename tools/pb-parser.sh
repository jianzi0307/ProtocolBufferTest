#!/bin/sh
if [ "$1" == '' ]; then
    echo "miss input file.\n Usage: ./$0 filename.proto"
    exit 1;
fi
protoc --plugin=protoc-gen-as3=./protoc-gen-as3 --as3_out=. $1
