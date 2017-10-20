#!/bin/sh

set -e

DOWNLOAD_URL="http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/${DOWNLOAD_FILENAME}"
DOWNLOAD_SHA256="76faebe03f6c963127dbb73c13eab58c9a3faeae48779f049066a21c087c5db2"

echo "Downloading ${DOWNLOAD_FILENAME}"
curl -Ls -o "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}" "${DOWNLOAD_URL}"

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
