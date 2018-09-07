#!/bin/zsh

setopt extendedglob
autoload zmv

readonly installer=$0:P

# noglob to pass * through to zmv
# -W to make zmv handle * -> .*
# -L -s does ln -s instead of mv
# $PWD/* to get symlink with full path
# ~$installer to exclude this script
noglob zmv ${DRY_RUN+-n} -W -L -s ${FORCE+-f} $PWD/*~$installer ~/.*
