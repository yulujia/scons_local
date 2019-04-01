#!/usr/bin/env bash

# TARGET_PREFIX
#    specify where to install  executables, libraries, and header files
#    - works for all components suppported by scons local
#    - each component will create its own sub directory in that path.
#        e.g. TARGET_PATH=mypath
#        mercury will create:
#            mypath
#            |-- mercury
#                |-- include
#                |-- lib
#                `-- share
# PREBUILT_PREFIX
#    specify where to find installed components. This is to be paired with
#    TARGET_PREFIX.
#    - works for all components
#    - It expects each component to be in its own sub directory.
#        e.g. PREBUILT_PREFIX=mypath, scons local will assume mercury like:
#            mypath
#            |-- mercury
#                |-- include
#                |-- lib
#                `-- share
# PREFIX
#    puts headers, libs from all components in the same tree. A component won't
#    create its own sub directory.
#    e.g. PREFIX=mypath stuff from mercury and cart will be in the tree:
#                mypath
#                |-- include
#                |-- lib
#                `-- share

set -e
set -x

HOSTNAME=$(hostname -s)

OPTS=(COMPILER=gcc \
      MERCURY_SRC=/home/yulujia/codes/mercury-github \
      TARGET_PREFIX=/home/yulujia/codes/prebuilt-with-scons-local-$HOSTNAME \
      --build-config=/home/yulujia/codes/scons-local-build-run-this-on-$HOSTNAME/utils/build.config \
      --config=force \
      --build-deps=yes \
      --update-prereq=pmix,ompi \
      VERBOSE=1 \
      -j8 \
)

(cd /home/yulujia/codes/prebuilt-with-scons-local-$HOSTNAME; rm -rf ompi pmix; cd -)
scons "${OPTS[@]}" install REQUIRES=ompi | tee compile-ompi.log
