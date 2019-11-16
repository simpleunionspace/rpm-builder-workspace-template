#!/bin/bash

SPECNAME=$1

BASEPATH=$(dirname "$0")

if [ ! -d $BASEPATH/../tmp/rpm/$SPECNAME ]; then
    mkdir -p $BASEPATH/../tmp/rpm/$SPECNAME
fi

docker run `
       -it `
       -v $BASEPATH/../src/$SPECNAME:/opt/builder/in `
       -v $BASEPATH/../tmp/rpm/$SPECNAME:/opt/builder/out `
       lifepainspace/rpm-builder:latest
