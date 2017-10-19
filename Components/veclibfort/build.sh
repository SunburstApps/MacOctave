#!/bin/sh

set -e

which -s gfortran || {
	echo "ERROR: gfortran is required" 1>&2
	echo "Try \`brew install gcc\`" 1>&2
	exit 1
}

cd "${DERIVED_FILE_DIR}"
[ -d vecLibFort-0.4.2 ] || {
	echo "Extracting ${DOWNLOAD_FILENAME}"
	tar xf "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}"
}

cd vecLibFort-0.4.2
echo Building
make all \
&> "${DERIVED_FILE_DIR}/make.log"

echo Checking
make check \
&> "${DERIVED_FILE_DIR}/check.log"

touch "${DERIVED_FILE_DIR}/build.done"
