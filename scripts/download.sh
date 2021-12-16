#!/bin/bash
set -ev

J2OBJC_VERSION="2.8"
# SHA1_CHECKSUM=e9d2ae81dfbed6610af3ae744dd0636140e3c928

if [[ -d j2objc_lib ]]; then
  exit
fi

echo "Fetching J2ObjC v${J2OBJC_VERSION} from https://github.com/google/j2objc/releases/download/${J2OBJC_VERSION}/j2objc-${J2OBJC_VERSION}.zip"
echo "Fetching J2ObjC-frameworks v${J2OBJC_VERSION} from https://github.com/google/j2objc/releases/download/${J2OBJC_VERSION}/j2objc-${J2OBJC_VERSION}-frameworks.zip"
curl -OL https://github.com/google/j2objc/releases/download/${J2OBJC_VERSION}/j2objc-${J2OBJC_VERSION}.zip
curl -OL https://github.com/google/j2objc/releases/download/${J2OBJC_VERSION}/j2objc-${J2OBJC_VERSION}-frameworks.zip
# echo "${SHA1_CHECKSUM}  j2objc-${J2OBJC_VERSION}.zip" | shasum -c
unzip -o -q j2objc-${J2OBJC_VERSION}.zip
unzip -o -q j2objc-${J2OBJC_VERSION}-frameworks.zip

J2OBJC_PATH=j2objc-${J2OBJC_VERSION}

mkdir j2objc_lib
mv  $J2OBJC_PATH/include \
    $J2OBJC_PATH/lib \
    $J2OBJC_PATH/j2objc \
    $J2OBJC_PATH/j2objcc \
    j2objc_lib
rm -rf j2objc-${J2OBJC_VERSION} j2objc-${J2OBJC_VERSION}.zip j2objc-${J2OBJC_VERSION}-frameworks.zip

touch j2objc_lib/VERSION
echo $J2OBJC_VERSION > j2objc_lib/VERSION
