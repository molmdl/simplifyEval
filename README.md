# SimplifyEval
A collection of double-click scripts and tutorial materials of a simplified workflow of structure-based drug design. Utilizing Open-source PyMOL, OpenBabel and Smina installed via conda.

![Platform](https://img.shields.io/static/v1?label=platform&message=windows%20%7C%20macos%20%7C%20linux&color=informational)
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fmolmdl%2FsimplifyEval&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)
[![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]
[![License](https://img.shields.io/badge/License-BSD%203-lightgrey.svg)](https://opensource.org/license/bsd-3-clause/)

<b>Handouts and tutorials</b> in this work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

<b>Code</b> in this work is licensed under the <a href="https://opensource.org/license/bsd-3-clause/">BSD 3-Clause license</a>.

---
## Description 
Many students who lack computational background love double-clickers. Whenever they see an icon, they double-click it. If the double-click action does not open a new window, they lose 50% of their motivation. If they found that it is a command-line program, they lose 90% of their motivation.

This is a prelimary attempt of making a tutorial with simplified double-click scripts to introduce molecular modelling to students from the experimental background who mainly use pymol. 

<b> WARNING! Tutorials and demos got a lot of typos and grammatical mistakes. I didn't have time to fix it. </b>

It wasn't a github repository so the directory structure is strange, it was just a folder that I throw random stuff into. I don't have the time to change the directory structure, but I may fix it upon request. 

Code is far from optimal and weren't tested throughly. I decide to provide it here on github in case someone found it useful, but it won't be frequently updated.

The lazy version "box-local" was tested on Windows, Linux and Mac. 
The std version is more useful but only tested on linux (partially on Windows 10)


## From the original README which is also included in "release/v0.1"
Inspired by the blogpost at [https://www.cheminformania.com/ligand-docking-with-smina/] and different “docking-by-
hand” protocols (e.g. by VR + IMD) published in major scientific journals, this workflow aimed to further lower 
the technical barrier for novice users to use molecular docking techniques, especially for researchers from 
experimental groups of related fields, allow them to focus more on the design process instead of software 
installation and command-line usage.

0. System requirements
    - Most 64bit computers running Windows, OSX or Linux should work.
    - More than 1 GB of disk space for software installation. Recommanded to have over 10 GB:
        - to store the data generated by the software 
        - to process the large molecular database downloaded for virtual screening

1. Intallation
    - This workflow majorly depends on pymol-open-source, smina and openbabel, which can be installed via anaconda.
    - Windows users also need a bash environment with necessary tools, we use msys2-base from anaconda distribution.
    - A sample installation script to install all the necessary tools (except the optimize plugin in pymol) have 
      been provided in the script directory for windows and OSX/linux (unix) users.
    - If you have PyMOL already and don't want to install another one, make sure your openbabel is installed in the 
      same python environment for the Optimize plugin to work. In that case, you only need to install smina. 
      You may still want to create a new conda enviroment so that smina can use a compatible version of python and
      openbabel without conflicting the openbabel already in your system.

---
## Usage
Only the scripts in "release/v0.1" have been tested on all major platforms. Installation instructions can be found in "release/v0.1/doc".

---
## Contents in "release/v0.1" folder
### doc
- Handouts 
    - A set of handouts for self-paced studying prepared for high-school interns and undergraduate students. (SARS-CoV-2 NSP16 inhibitor design)
- Tutorials 
    - Worked example with screenshot to train postgraduate researchers in a collaborating experimental lab (drug design targeting FTO)
    - Crrently only prepared for the "lazy" protocol.

See the README pdf for details. 

### scripts
- scripts for different platforms 
- note that the std protocol is only available in the unix folder or less generic versions in WORKDIR 


## Contents in "WORKDIR"
- Original version of scripts of different protocols I have played with on Windows/linux computer.
- Test of different protocols. 
- Messy, incomplete documentation and logs.

---
## Remarks 
Issues on Mac:
- Mac with M2 clips does not support the conda version of smina. Users may need to get the binary from the smina official repository.
- May need some tricks to let the double-click scripts pass the security warning.
Open-source version of pymol from conda has issues with calling the plugin gui on Mac, hence providing an additional script for the optimize function.

Notes for Windows users:
- Pymol optimize plugin gui has a bug, it crashes as the plugin window being manually resized. Use the maximize button instead.

Notes for all:
- Please adjust the PATH to conda env accordingly for the code to work properly.
- Adjust other parameters, e.g. autobox distance as you need
- Flexible ligands are always difficult to sample, you may increase num of modes or repeat the docking a few times to sample a better pose. 
