#!/usr/bin/env bash

#replace the path with the correct one
#e.g. for windows users, if the path to your smina is "C:\smina\smina.exe", input "/c/smina/smina.exe" in the following line
# for linux this is likely ~/.conda/envs/chemtools/bin/smina
smina=/c/Users/nglok/.conda/envs/chemtools-win10/Library/bin/smina.exe

if [[ ! -e "./docking-flex" ]] ; then
		mkdir ./docking-flex
	fi

if [[ ! -e 'list.txt' ]] ; then
	for c in `ls ./complex/*.pdb` ; do
		basename $c .pdb >> list.txt
	done
	for f in `cat list.txt` ; do
		complex=$f
		if [[ ! -e "${complex}_docked.pdb" ]] ; then
			grep UNK ./complex/${complex}.pdb > ./complex/${complex}_lig.pdb
			grep -v UNK ./complex/${complex}.pdb > ./complex/${complex}_rec.pdb
			$smina -r ./complex/${complex}_rec.pdb -l ./complex/${complex}_lig.pdb --log ./docking-flex/${complex}_docked.log -o ./docking-flex/${complex}_docked.pdb \
				--addH off --autobox_ligand ./complex/${complex}_lig.pdb --autobox_add 2 \
				--flexdist_ligand ./complex/${complex}_lig.pdb --flexdist 4 --out_flex ./docking-flex/${complex}_flex_rec_docked.pdb \
				--exhaustiveness 32 --num_modes 30 --cpu 2
			rm ./complex/${complex}_lig.pdb
			rm ./complex/${complex}_rec.pdb
			if [[ ! -e "./dock_flex_summary.csv" ]] ; then
				echo 'complex,score' > dock_flex_summary.csv
			fi
			echo "${complex},`grep '0.000' ./docking-flex/${complex}_docked.log | awk '{print $2}'`" >> dock_flex_summary.csv
		fi
	done
	rm list.txt
else
	echo list.txt already exist!
	echo Use dock_list.sh instead to evaluate a custom list of complexes.
fi
