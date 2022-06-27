# Drug repurposing for SARS-CoV-2: a high-throughput molecular docking, molecular dynamics, machine learning, and DFT study

1) Only JOBS.sh need to be called by the user to perform a) POTCAR file constructions b) perform VASP relax calculations c) HOMO/LUMO orbital plots d) Bader charge plots

2) Please arrange the standard input files as stated in comments in 1st code blocks of files JOBS.sh and VASP.GPU.sb (do not modify INCAR's keyward values since the post processing script is gonna read them and change those values automatically)

3) These scripts are designed for 18 ligands as given in our associated paper[1]. Those 18 ligands contains atom types N C O H F S. You need to modify few code lines in files JOBS.sh and VASP.GPU.sb if you have any other number of ligands or ligand types than described in our paper. Please refer to trajectory video of one of complexes modelled[2].

4) One can loop script, Bio_Ligands_Char.sh, through all ligands to calculate the quantum chemical characterstics as explain in the publication[1]. 

[1]
https://link.springer.com/article/10.1007/s10853-022-07195-8
Drug repurposing for SARS-CoV-2: a high-throughput molecular docking, molecular dynamics, machine learning, and DFT study

Jatin Kashyap, Dibakar Datta

[2]
https://youtu.be/4yTQf053AGM
