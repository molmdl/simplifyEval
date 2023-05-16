@echo OFF

echo "(1)(a) Make sure dock_flex_autolist.sh is in the same directory as this program."
echo "(1)(b) Make sure the PATH to smina is correct in dock_flex_autolist.sh."
echo "(2) Make sure you have all the complex.pdb files in a "complex" folder, located in the same directory as this script!"
echo "(3)(a) This program assume the ligand name in PDB is UNK, make sure this is true!"
echo "(3)(b) This program assume the ligand is already positioned close to the targeted site, make sure this is true!"
echo "Please check items (1)-(3) and fix them before you continue."
pause

echo Assuming a "Just Me" miniconda3 installation...

rem Define the path to anaconda
set CONDAPATH=%USERPROFILE%\miniconda3

rem Define the name of the installed environment
set ENVNAME=chemtools-win10

rem Define the path to the installed environment
set ENVPATH=%USERPROFILE%\miniconda3\envs\%ENVNAME%

rem Activate the conda environment
call %CONDAPATH%\Scripts\activate.bat %ENVPATH%

rem Run the bash script
bash dock_flex_autolist.sh

rem Deactivate the environment
call conda deactivate

rem uncomment the following line to pause before quitting
pause

