#!/bin/zsh

setopt extendedglob
autoload zmv

readonly installer=$0:P

# noglob to pass * through to zmv
# -W to make zmv handle * -> .*
# -L -s does ln -s instead of mv
# $PWD/* to get symlink with full path
# ~$installer to exclude this script
# Two -f flags:
#   1. -f to force zmv to run even if target exists
#   2. -o -f to force ln (-o passes flags to underlying command)
noglob zmv ${DRY_RUN+-n} -W -L -s -f ${FORCE+-o -f} $PWD/*~$installer ~/.*
