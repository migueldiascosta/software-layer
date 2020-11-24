#!/bin/bash

export EPREFIX=/eessi/2020.10/compat/x86_64/

# get pilot version
eval $(grep EESSI_PILOT_VERSION= EESSI-pilot-install-software.sh)
echo "EESSI_PILOT_VERSION=$EESSI_PILOT_VERSION"

export EESSI_SOURCEPATH=/eessi/$EESSI_PILOT_VERSION/software/sources

# change prefix path
if [ ! -d /eessi/$EESSI_PILOT_VERSION/init ]; then 
    cp -R init /eessi/$EESSI_PILOT_VERSION/; 
    sed -i 's|/cvmfs/pilot.eessi-hpc.org/|/eessi/|' /eessi/$EESSI_PILOT_VERSION/init/bash
    sed -i 's|export PS1=|#export PS1=|' /eessi/$EESSI_PILOT_VERSION/init/bash
fi

# install
./EESSI-pilot-install-software.local.foss.2020a.sh $@
