# MacOctave

This repository contains an Xcode project that builds a complete,
usable-as-is copy of GNU Octave for macOS, including all required
runtime dependencies. Currently this project targets Octave 4.2.1,
but this may change in the future as new versions of Octave are
released.

This repository is fully standalone (it downloads all sources as
required), with one exception: **GCC is required**, and must be
installed separately. This is because I would have to build GCC
_twice_ (once for use during the build, and once for distribution)
were I to build it using the same mechanism I use to build the
rest of MacOctave. I recommend using [Homebrew](https://brew.sh)
to install GCC. Please note that while a `gcc` binary is shipped
with Xcode, this will not work, as it is really just a symbolic
link to `clang`. Octave requires GCC features that have not been
ported to Apple `clang` (Fortran support in particular).

This repository itself is licensed under the terms of the Apache
License, version 2.0, but the components downloaded and compiled
as part of the build are licensed under different terms. The source
tarballs downloaded will be copied into the `Contents/Resources/Sources`
subdirectory of the output bundle, to comply with the terms of licenses
that require source redistribution (such as the GNU GPL).
