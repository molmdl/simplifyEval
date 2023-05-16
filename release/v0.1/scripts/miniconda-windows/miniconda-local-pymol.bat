@echo OFF

echo Assuming a "Just Me" miniconda3 installation...
echo ...
echo Starting Pymol...
echo ...

rem Define the path to anaconda
set CONDAPATH=%USERPROFILE%\miniconda3

rem Define the name of the installed environment
set ENVNAME=chemtools-win10

rem Define the path to the installed environment
set ENVPATH=%USERPROFILE%\miniconda3\envs\%ENVNAME%

rem Activate the conda environment
call %CONDAPATH%\Scripts\activate.bat %ENVPATH%

rem Run pymol-open-source in the conda environment
python %ENVPATH%\Lib\site-packages\pymol\__init__.py %*

rem Deactivate the environment
call conda deactivate