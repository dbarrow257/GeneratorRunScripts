#!/bin/bash

# Generate GiBUU events
GiBUU.x < JobCards/GiBUU_MicroBooNE_numu.job

# Convert to Nuisance format
PrepareGiBUU -i EventOutput.Pert.00000001.root -f Inputs/MCC9_FluxHist_volTPCActive.root,hEnumu_cv -o GiBUU.gprep.root

# Convert to Nuisance flat tree format
nuisflat -i GiBUU:GiBUU.gprep.root -o /project/GiBUU.flat.root

# Remove unnecessary files
rm *.dat
rm GiBUU_database_decayChannels.txt
rm GiBUU_database.tex
rm main.run
rm PYR.RG
rm EventOutput.Pert.00000001.root
rm GiBUU.gprep.root
