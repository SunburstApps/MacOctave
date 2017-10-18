#!/bin/sh

#  download.sh
#  MacOctave
#
#  Created by William Kent on 10/18/17.
#  Copyright © 2017 William Kent. All rights reserved.

set -e

DOWNLOAD_URL="https://gmplib.org/download/gmp/${DOWNLOAD_FILENAME}"
DOWNLOAD_SHA256="87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912"

echo "Downloading ${DOWNLOAD_FILENAME}"
curl -Ls -o "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}" "${DOWNLOAD_URL}"
echo "Downloading ${DOWNLOAD_FILENAME} - done"

CHECKSUM=`shasum -a 256 ${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME} | sed -Ee 's,  .*$,,g'`
if [ "${CHECKSUM}" = "${DOWNLOAD_SHA256}" ]; then
	echo "Checksum matches"
else
	echo "ERROR: Checksum did not match!" 1>&2
	echo "Expected: ${DOWNLOAD_SHA256}" 1>&2
	echo "Actual:   ${CHECKSUM}" 1>&2

	rm -f "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}"
	exit 0
fi
