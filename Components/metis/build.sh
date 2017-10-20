#!/bin/sh

set -e

which -s cmake || {
	echo "ERROR: CMake is required" 1>&2
	echo "Try \`brew install cmake\`" 1>&2
	exit 1
}

cd "${DERIVED_FILE_DIR}"
[ -d metis-5.1.0 ] || {
	echo "Extracting ${DOWNLOAD_FILENAME}"
	tar xf "${DERIVED_FILE_DIR}/${DOWNLOAD_FILENAME}"

	# The patch commands will print their own status output,
	# so there's no need to print a header here.
	pushd metis-5.1.0 > /dev/null
	for FILE in $(ls ${SRCROOT}/Components/metis/patches/*.patch); do
		case $FILE in
			*.p1.patch)
				patch -p1 < $FILE;;
			*.patch)
				patch -p0 < $FILE;;
			*)
				echo "Don't know how to apply $(basename $FILE), skipping" 1>&2;;
		esac
	done
	popd > /dev/null
}

cd metis-5.1.0
echo Configuring
make config \
	prefix=${OCTAVE_BUNDLE_PREFIX} \
	shared=1 \
&> "${DERIVED_FILE_DIR}/configure.log"

echo Building
make \
&> "${DERIVED_FILE_DIR}/make.log"

touch "${DERIVED_FILE_DIR}/build.done"
