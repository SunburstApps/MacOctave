#!/bin/sh

set -e
cd "${DERIVED_FILE_DIR}/vecLibFort-0.4.2"

mkdir -p /tmp/veclibfort.dst
make install PREFIX=/tmp/veclibfort.dst \
&> "${DERIVED_FILE_DIR}/install.log"

rm -rf "${SRCROOT}/BuildOutputs/veclibfort"
mkdir -p "${SRCROOT}/BuildOutputs/veclibfort"
mv -f /tmp/veclibfort.dst/lib "${SRCROOT}/BuildOutputs/veclibfort/lib"
rm -r /tmp/veclibfort.dst

mkdir -p "${SRCROOT}/BuildOutputs/Tarballs"
cp -f "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}" "${SRCROOT}/BuildOutputs/Tarballs/${DOWNLOAD_FILENAME}"

touch "${DERIVED_FILE_DIR}/install.done"
