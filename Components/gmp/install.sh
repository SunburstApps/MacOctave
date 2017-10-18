#!/bin/sh

#  install.sh
#  MacOctave
#
#  Created by William Kent on 10/18/17.
#  Copyright © 2017 William Kent. All rights reserved.

set -e
cd "${DERIVED_FILE_DIR}/build"

mkdir -p /tmp/gmp.dst
make install DESTDIR=/tmp/gmp.dst \
&> "${DERIVED_FILE_DIR}/install.log"

mv -f /tmp/gmp.dst/${OCTAVE_BUNDLE_PREFIX} "${SRCROOT}/BuildOutputs/gmp"
rm -r /tmp/gmp.dst

mkdir -p "${SRCROOT}/BuildOutputs/Tarballs"
cp -f "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}" "${SRCROOT}/BuildOutputs/Tarballs/${DOWNLOAD_FILENAME}"

touch "${DERIVED_FILE_DIR}/install.done"
