#!/usr/bin/env bash

#replace the path with the correct one
#e.g. for windows users, if the path to your smina is "C:\smina\smina.exe", input "/c/smina/smina.exe" in the following line
# for linux this is likely ~/.conda/envs/chemtools/bin/smina
smina=/c/Users/nglok/.conda/envs/chemtools-win10/Library/bin/smina.exe

if [[ ! -e 'rec-list.txt' ]] ; then
	for r in `ls ./receptor/*.pdb` ; do
		basename $r .pdb >> rec-list.txt
	done
else
	echo "rec-list.txt already exist! Using the provided copy."
fi

if [[ ! -e 'lig-list.txt' ]] ; then
	for l in `ls ./ligand/*.sdf` ; do
		basename $l .sdf >> lig-list.txt
	done
else
	echo "lig-list.txt already exist! Using the provided copy."
fi

if [[ ! -e "./docking" ]] ; then
	mkdir ./docking
fi

if [[ -e "./reference.sdf" ]] ; then
	for rec in `cat rec-list.txt` ; do
		for lig in `cat lig-list.txt` ; do
			if [[ ! -e "./docking/${rec}-${lig}_docked.sdf" ]] ; then
				$smina -r ./receptor/${rec}.pdb -l ./ligand/${lig}.sdf --log ./docking/${rec}-${lig}_docked.log -o ./docking/${rec}-${lig}_docked.sdf \
					--addH off --autobox_ligand ./reference.sdf --autobox_add 4 \
					--flexdist_ligand ./reference.sdf --flexdist 4 --out_flex ./docking/${rec}-${lig}_flex_rec_docked.sdf \
					--exhaustiveness 32 --num_modes 30 --cpu 2
				if [[ ! -e "./dock_summary.csv" ]] ; then
					echo 'receptor,ligand,score' > dock_flex_summary.csv
				fi
				echo "${rec},${lig},`grep '0.000' ${complex}_docked.log | awk '{print $2}'`" >> dock_flex_summary.csv
			else
				echo "./docking/${rec}-${lig}_docked.sdf already exist, skipping."
			fi
		done
	done
else
	echo reference.sdf does not exist!
	echo Please provide a reference ligand that define the binding site in the same directory as this script!
fi

echo "Cleaning..."
rm rec-list.txt
rm lig-list.txt

echo "Done!"