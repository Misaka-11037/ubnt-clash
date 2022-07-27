#!/bin/sh

DIR=$(mktemp -d)

cp -R unifi-os $DIR/ubnt-clash 
cd $DIR 
tar zcf unifi-os.tar.gz .

cd -
mv $DIR/unifi-os.tar.gz ../

echo unifi-os.tar.gz compressed to ..

