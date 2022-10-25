#!/bin/bash

export Events=100

# Generate GENIE events
gevgen -n $Events -p 14 -t 1000180400 -e 0.,10.  --event-generator-list CC --tune G18_10a_02_11a --cross-sections /opt/genie/tune/genie_xsec/v3_00_06/NULL/G1810a0211a-k250-e1000/data/gxspl-FNALbig.xml.gz -f Inputs/MCC9_FluxHist_volTPCActive.root,hEnumu_cv

# Convert file from ghep to nuisance format
PrepareGENIE -i gntp.0.ghep.root -t 1000180400[1] -o nuisance_gntp.0.gprep_G18_10a_02_11a.root -f Inputs/MCC9_FluxHist_volTPCActive.root,hEnumu_cv

# Convert to nuisance flat tree format
nuisflat -i GENIE:nuisance_gntp.0.gprep_G18_10a_02_11a.root -o /project/GENIE.flat.root

# Remove all unnecessary files
rm genie-mcjob-0.status 
rm input-flux.root
rm gntp.0.ghep.root
rm nuisance_gntp.0.gprep_G18_10a_02_11a.root
