#!/bin/bash
remote_systems_home='absolute/path/to/ligand/directories/' # ligands directories i.e. 6lu7_N3/ etc...
relax_files='absolute/path/to/relax_calculation/input/files/' # cleanup.sh  INCAR(please look for file INCAR_relax for this file format)  KPOINTS  VASP.GPU.sb(this VASP.GPU.sb is same VASP.GPU.sb shared in this github directory)
potcars='absolute/path/to//VASP/POTENTIALS' # directory containing all POTCAR files comes out of VASP's bundle 

#creating POTCAR files
#potentials N C O , first 3 elements, all ligands
for value in 6lu7_N3/final/ZINC000015959516 6lu7_N3/final/ZINC000596245498 6m0j_+/final/ZINC000590498462 6m0j_+/final/ZINC000593073653 6m71_nsp12_7_8/final/ZINC000410177506 6m71_nsp12_7_8/final/ZINC000495219491 6w9c_+/final/ZINC000004260192 6w9c_+/final/ZINC000916475592 6w63_x77/final/ZINC000012883288 6w63_x77/final/ZINC000015959596 7bv2_nsp12-7/final/ZINC000616537204 7bv2_nsp12-7/final/ZINC001176619532 7bv2_nsp12-8/final/ZINC000517580540 7bv2_nsp12-8/final/ZINC001180048431 7bv2_remdesivir/final/ZINC000596164676 7bv2_remdesivir/final/ZINC001180454492 7bv2_rna/final/ZINC000760123550 7bv2_rna/final/ZINC000952855827 
do
cd $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/ && mv POSCAR ../../ && rm -rf * ; mv ../../POSCAR ./ &&  # comment out this if only POSCAR exist already
cat $potcars/N/POTCAR $potcars/C/POTCAR $potcars/O/POTCAR >$remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR

done
unset value

#potentials, fourth element, partial ligands
fourthElement=(H S H F H S H S H S H S F H)
declare -i value0
value0=0
for value in 6lu7_N3/final/ZINC000015959516 6lu7_N3/final/ZINC000596245498 6m0j_+/final/ZINC000593073653 6m71_nsp12_7_8/final/ZINC000495219491 6w9c_+/final/ZINC000004260192 6w9c_+/final/ZINC000916475592 6w63_x77/final/ZINC000015959596 7bv2_nsp12-7/final/ZINC000616537204 7bv2_nsp12-7/final/ZINC001176619532 7bv2_nsp12-8/final/ZINC000517580540 7bv2_nsp12-8/final/ZINC001180048431 7bv2_remdesivir/final/ZINC000596164676 7bv2_remdesivir/final/ZINC001180454492 7bv2_rna/final/ZINC000952855827 
do
cat $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR $potcars/${fourthElement[$value0]}/POTCAR >$remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR2 
rm $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR && mv $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR2 $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR 
value0+=1
done
unset value ; unset fourthElement ; unset value0

#potentials, fifth element, partial ligands
fourthElement=(H H H H S)
declare -i value0
value0=0
for value in 6lu7_N3/final/ZINC000596245498 7bv2_nsp12-7/final/ZINC000616537204 7bv2_nsp12-8/final/ZINC000517580540 7bv2_remdesivir/final/ZINC000596164676 7bv2_remdesivir/final/ZINC001180454492 
do
cat $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR $potcars/${fourthElement[$value0]}/POTCAR >$remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR2 
rm $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR && mv $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR2 $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/POTCAR 
value0+=1
done
unset value ; unset fourthElement ; unset value0
#creating POTCAR files ends

# job submissions
for value in 6lu7_N3/final/ZINC000015959516 6lu7_N3/final/ZINC000596245498 6m0j_+/final/ZINC000590498462 6m0j_+/final/ZINC000593073653 6m71_nsp12_7_8/final/ZINC000410177506 6m71_nsp12_7_8/final/ZINC000495219491 6w9c_+/final/ZINC000004260192 6w9c_+/final/ZINC000916475592 6w63_x77/final/ZINC000012883288 6w63_x77/final/ZINC000015959596 7bv2_nsp12-7/final/ZINC000616537204 7bv2_nsp12-7/final/ZINC001176619532 7bv2_nsp12-8/final/ZINC000517580540 7bv2_nsp12-8/final/ZINC001180048431 7bv2_remdesivir/final/ZINC000596164676 7bv2_remdesivir/final/ZINC001180454492 7bv2_rna/final/ZINC000760123550 7bv2_rna/final/ZINC000952855827 
do
cp $relax_files/* $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/ && cd $remote_systems_home/$value/ANALYSIS/BIG_BOX_POSCAR/ && sbatch VASP.GPU.sb
done
# job submissions ends
