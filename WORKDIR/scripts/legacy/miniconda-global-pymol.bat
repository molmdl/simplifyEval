@echo OFF

echo Assuming a "All Users" miniconda3 installation...
echo ...
echo Starting Pymol...
echo ...

rem Define the path to miniconda3/anaconda3
set CONDAPATH=C:\ProgramData\Miniconda3

rem Define here the name of the environment
set ENVNAME=chemtools-win10

rem Define the path to the installed environment
set ENVPATH=%USERPROFILE%\.conda\envs\%ENVNAME%

rem Activate the conda environment
call %CONDAPATH%\Scripts\activate.bat %ENVPATH%

rem Run a python script in that environment
python %ENVPATH%\Lib\site-packages\pymol\__init__.py %*

rem Deactivate the environment
call conda deactivate