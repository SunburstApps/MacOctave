#!/bin/sh

set -e

DOWNLOAD_URL="https://github.com/mcg1969/vecLibFort/archive/0.4.2.tar.gz"
DOWNLOAD_SHA256="c61316632bffa1c76e3c7f92b11c9def4b6f41973ecf9e124d68de6ae37fbc85"

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

