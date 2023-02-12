#!/bin/bash

# setup slackpkg+
cd /tmp
wget https://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-1.8.0-noarch-7mt.txz/download -O slackpkg+-1.8.0-noarch-7mt.txz
installpkg slackpkg+-1.8.0-noarch-7mt.txz

# setup multilib
SLACKVER=15.0
cd /root
mkdir multilib
cd multilib
lftp -c "open http://slackware.com/~alien/multilib/ ; mirror -c -e ${SLACKVER}"
cd ${SLACKVER}
upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
