# SimplifyEval
Set of scripts and tutorial materials of a simplified workflow of structure-based drug design. Based on PyMOL and smina.

---
## Description 
An early attempt of making a tutorial with simplified double-click scripts to introduce molecular modelling to students from the experimental background who mainly use pymol. 

!! Tutorials and demos got a lot of typos and grammatical mistakes. I didn't have time to fix it.

It wasn't a github repository so the directory structure is strange, it was just a folder that I throw random stuff into. I don't have the time to change the directory structure, but I may fix it upon request. 

Codes are far from optimal and weren't tested throughly. I decide to provide it here on github in case someone found it useful, but it won't be frequently updated.

The lazy version "box-local" was tested on Windows, Linux and Mac. 
The std version is more useful but only tested on linux (partially on Windows 10)

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


# Contents in "WORKDIR"
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
- Pymol optimize plugin gui has a bug to clash as the window being manually resized. Use the maximize button instead.

Notes for all:
- Please adjust the PATH to conda env accordingly for the code to work properly.
- Adjust other parameters, e.g. autobox distance as you need
- For flexible ligands are always difficult to sample, you may increase num of modes or repeat a few times to sample a better pose. 

---

<a rel="license" href="http://creativecommons.org/licenses/by-nc/2.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/2.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/2.0/">Creative Commons Attribution-NonCommercial 2.0 Generic License</a>.
