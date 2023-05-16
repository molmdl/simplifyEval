#!/usr/bin/env bash

#replace the path with the correct one
#e.g. for windows users,  if the path to your smina is "C:\smina\smina.exe", input "/c/smina/smina.exe" in the following line
# for linux this is likely ~/.conda/envs/chemtools/bin/smina
smina=/PATH/TO/SMINA/smina.exe

if [[ ! -e "./min-flex" ]] ; then
	mkdir ./min-flex
fi

if [[ ! -e 'list.txt' ]] ; then
	for c in `ls ./complex/*.pdb` ; do
		basename $c .pdb >> list.txt
	done
	for f in `cat list.txt` ; do
		complex=$f
		if [[ ! -e "./min-flex/${complex}_min.pdb" ]] ; then
			grep UNK ./complex/${complex}.pdb > ./complex/${complex}_lig.pdb
			grep -v UNK ./complex/${complex}.pdb > ./complex/${complex}_rec.pdb
			$smina -r ./complex/${complex}_rec.pdb -l ./complex/${complex}_lig.pdb --log ./min-flex/${complex}_min.log -o ./min-flex/${complex}_min.pdb \
				--addH off --autobox_ligand ./complex/${complex}_lig.pdb --autobox_add 2 \
				--flexdist_ligand ./complex/${complex}_lig.pdb --flexdist 4 --out_flex ./min-flex/${complex}_flex_rec_min.pdb \
				--minimize --minimize_iters 50000 --cpu 2
			rm ./complex/${complex}_lig.pdb
			rm ./complex/${complex}_rec.pdb
			if [[ ! -e "./min_flex_summary.csv" ]] ; then
				echo 'complex,score' > min_flex_summary.csv
			fi
			echo "${complex},`grep 'Affinity' ./min-flex/${complex}_min.log | awk '{print $2}'`" >> min_flex_summary.csv
		fi
	done
	rm list.txt
else
	echo list.txt already exist!
fi
	