# Drug repurposing for SARS-COV-2: A high-throughput molecular docking, molecular dynamics, machine learning, & ab-initio study

1) Only JOBS.sh need to be called by the user to perform a) POTCAR file constructions b) perform VASP relax calculations c) HOMO/LUMO orbital plots d) Bader charge plots

2) Please arrange the standard input files as stated in comments in 1st code blocks of files JOBS.sh and VASP.GPU.sb (do not modify INCAR's keyward values since the post processing script is gonna read them and change those values automatically)

3) These scripts are designed for 18 ligands as given in our associated paper[1]. Those 18 ligands contains atom types N C O H F S. You need to change files JOBS.sh and VASP.GPU.sb if you have any other number of ligands or ligand types than described in our paper.


[1]
http://dx.doi.org/10.13140/RG.2.2.21360.58885
Drug repurposing for SARS-COV-2: A high-throughput molecular docking, molecular dynamics, machine learning, & ab-initio study
Jatin Kashyap, Dibakar Datta
