#!/bin/sh

set -e
cd "${DERIVED_FILE_DIR}/metis-5.1.0"

mkdir -p /tmp/metis.dst
export DESTDIR=/tmp/metis.dst
make install \
&> "${DERIVED_FILE_DIR}/install.log"
unset DESTDIR

rm -rf "${SRCROOT}/BuildOutputs/metis"
mv -f /tmp/metis.dst/${OCTAVE_BUNDLE_PREFIX} "${SRCROOT}/BuildOutputs/metis"
rm -r /tmp/metis.dst

mkdir -p "${SRCROOT}/BuildOutputs/Tarballs"
cp -f "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}" "${SRCROOT}/BuildOutputs/Tarballs/${DOWNLOAD_FILENAME}"

touch "${DERIVED_FILE_DIR}/install.done"
