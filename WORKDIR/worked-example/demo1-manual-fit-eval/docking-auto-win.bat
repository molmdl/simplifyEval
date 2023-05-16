@echo OFF
rem modified from https://gist.githubusercontent.com/maximlt/531419545b039fa33f8845e5bc92edd6/raw/18df186517ddd1194fe3c4cb65c06ecd912cec7e/run_python_script_in_conda_env.bat
rem How to run a Python script in a given conda environment from a batch file.

rem It doesn't require:
rem - conda to be in the PATH
rem - cmd.exe to be initialized with conda init

echo "(1)(a) Make sure dock_autolist.sh is in the same directory as this program."
echo "(1)(b) Make sure the PATH to smina is correct in dock_autolist.sh."
echo "(2) Make sure you have all the complex.pdb files in a "complex" folder, located in the same directory as this script!"
echo "(3)(a) This program assume the ligand name in PDB is UNK, make sure this is true!"
echo "(3)(b) This program assume the ligand is already positioned close to the targeted site, make sure this is true!"
echo "Please check items (1)-(3) and fix them before you continue."
pause

rem Define here the path to your conda installation
set CONDAPATH=C:\ProgramData\Miniconda3
rem Define here the name of the environment
set ENVNAME=chemtools-win10

rem The following command activates the base environment.
rem call C:\ProgramData\Miniconda3\Scripts\activate.bat C:\ProgramData\Miniconda3
rem edit the envpath depends on the conda env. installation.
rem if %ENVNAME%==base (set ENVPATH=%CONDAPATH%) else (set ENVPATH=%CONDAPATH%\envs\%ENVNAME%)
if %ENVNAME%==base (set ENVPATH=%CONDAPATH%) else (set ENVPATH=%USERPROFILE%\.conda\envs\%ENVNAME%)

rem Activate the conda environment
rem Using call is required here, see: https://stackoverflow.com/questions/24678144/conda-environments-and-bat-files
call %CONDAPATH%\Scripts\activate.bat %ENVPATH%

rem run the script
bash dock_autolist.sh

rem Deactivate the environment
call conda deactivate

rem If conda is directly available from the command line then the following code works.
rem call activate someenv
rem python script.py
rem conda deactivate

rem One could also use the conda run command
rem conda run -n someenv python script.py

rem uncomment the following line to pause before quitting
pause

