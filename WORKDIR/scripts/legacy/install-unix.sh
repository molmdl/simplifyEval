#!/usr/bin/env bash

ENVNAME=chemtools

# assuming conda is alreay in your path!
# create a new conda environment
conda create -y -n $ENVNAME -c conda-forge smina pymol-open-source openbabel
# other useful tools: veusz (plotting), rdkit (cheminfomatics library, bulky but powerful), ipython (python scripting)