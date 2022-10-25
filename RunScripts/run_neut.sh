#!/bin/bash

# Generate NuWro events
neutroot2 JobCards/neut_uboone_num.card bnb.ub.num.neut_5_4_0_1.root

# Prepare NuWro events for Nuisance
PrepareNEUT -i bnb.ub.num.neut_5_4_0_1.root -o bnb.ub.num.neut_5_4_0_1.prep.root -G -f Inputs/MCC9_FluxHist_volTPCActive.root,hEnumu_cv

# Convert to Nuisance flat tree
nuisflat -i NEUT:bnb.ub.num.neut_5_4_0_1.prep.root -o /project/NEUT.flat.root

# Remove unnecessary files
rm bnb.ub.num.neut_5_4_0_1.root
rm bnb.ub.num.neut_5_4_0_1.prep.root
rm hEnumu_cv_o.root
