clear ; unset x ; unset myArray
x=$(awk '/E-fermi/{print NR}' OUTCAR)
echo $x>>row.txt
tr -s ' '  '\n'< row.txt > column.txt
rm row.txt ; mv column.txt temp.txt
lastElement=$( tail -n 1 temp.txt )
rm temp.txt
tail -n +$lastElement OUTCAR >>tempB.txt
sed -n '/band No.  band energies     occupation/,/soft charge-density along one line/p' tempB.txt >>tempC.txt
rm tempB.txt
grep 2.00000 tempC.txt | tail -1>>HOMO.txt
grep -m 1 0.00000 tempC.txt >>LUMO.txt
rm tempC.txt
tr -s ' '  '\n'< HOMO.txt > HOMO_Col.txt
mapfile -t myArray < HOMO_Col.txt
eHOMO=${myArray[2]}
echo $eHOMO
tr -s ' '  '\n'< LUMO.txt > LUMO_Col.txt
mapfile -t myArray < LUMO_Col.txt
eLUMO=${myArray[2]}
echo $eLUMO
rm HOMO.txt HOMO_Col.txt LUMO.txt LUMO_Col.txt
unset x ; unset myArray
echo "$( bc -l <<< "$eLUMO - $eHOMO" )">>E_gap.txt  #Egap
echo "$( bc -l <<< "($eLUMO - $eHOMO)/2" )">>ita.txt  #ita
echo "$( bc -l <<< "1 / (($eLUMO - $eHOMO) / 2)" )">>sigma.txt #sigma
echo "$( bc -l <<< "-1*(($eLUMO + $eHOMO)/2)" )">>zita.txt #zita
echo "$( bc -l <<< "((-1 * (($eLUMO + $eHOMO) / 2))*(-1 * (($eLUMO + $eHOMO) / 2))) / (2 * (($eLUMO - $eHOMO) / 2))" )">>omega.txt #omega

