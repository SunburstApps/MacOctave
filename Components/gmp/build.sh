#!/bin/sh

#  build.sh
#  MacOctave
#
#  Created by William Kent on 10/18/17.
#  Copyright © 2017 William Kent. All rights reserved.

set -e

cd "${DERIVED_FILE_DIR}"
[ -d gmp-6.1.2 ] || {
	echo "Extracting ${DOWNLOAD_FILENAME}"
	tar xf "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}"
}

echo The prefix is ${OCTAVE_BUNDLE_PREFIX}

mkdir -p build; cd build
echo Configuring
../gmp-6.1.2/configure \
	--prefix=${OCTAVE_BUNDLE_PREFIX} \
	--enable-cxx \
&> "${DERIVED_FILE_DIR}/configure.log"

echo Building
make \
&> "${DERIVED_FILE_DIR}/make.log"

echo Checking
make check \
&> "${DERIVED_FILE_DIR}/check.log"

touch "${DERIVED_FILE_DIR}/build.done"
