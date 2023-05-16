#!/usr/bin/env bash

# Assuming smina is in the current PATH

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

if [[ ! -e "./std-min" ]] ; then
	mkdir ./std-min
fi

if [[ -e "./reference.sdf" ]] ; then
	for rec in `cat rec-list.txt` ; do
		for lig in `cat lig-list.txt` ; do
			if [[ ! -e "./std-min/${rec}-${lig}_min.sdf" ]] ; then
				smina -r ./receptor/${rec}.pdb -l ./ligand/${lig}.sdf --log ./std-min/${rec}-${lig}_min.log -o ./std-min/${rec}-${lig}_min.sdf \
					--addH off --autobox_ligand ./reference.sdf --autobox_add 4 \
					--minimize --minimize_iters 50000 --cpu 2
				if [[ ! -e "./std-min_summary.csv" ]] ; then
					echo 'receptor,ligand,score' > std-min_summary.csv
				fi
				echo "${rec},${lig},`grep 'Affinity' ./std-min/${rec}-${lig}_min.log | awk '{print $2}'`" >> std-min_summary.csv
			else
				echo "./std-min/${rec}-${lig}_min.sdf already exist, skipping."
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
