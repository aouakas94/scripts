#!/bin/bash
liste=()
liste=`cat hosts`


for i in $liste;do

   if ! [[ $# = 1  ]]; then
   echo "veuillez sisair la commande a executer please!"
   exit 

   fi
   echo "     "
	ping -q -c1 $i > /dev/null
   if [[ $? -eq 1 ]] ; then
   echo "-------------- pas de connection avec $i  ------------- "
             echo "      "
   else
echo "------la liste des utilisateurs conecté sur $i --------------" ;
           echo $1 | ssh $i 

    #echo   `ssh $i "$1" | grep pts`

             echo "   "
     fi
done


exit

gethost()
{

liste=()
while IFS=$'\n' read hosts  ;do
liste+="${hosts}"

done < hosts

echo ${liste[*]}

}

for i in $(gethosts); do
echo $i
done
