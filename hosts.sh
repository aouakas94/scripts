#!/bin/bash
#je declare une vide
liste=()
#la liste s'actulise avec l contenu du fichier hosts
liste=`cat /home/aouakas/Bureau/scripts/hosts`

#pour chaque element de la liste
for i in $liste;do

# verifier le premier parametre est sisaie
   if ! [[ $# = 1  ]]; then
   echo "veuillez sisair la commande a executer please!"
   exit 

   fi
   echo "     "
#faire un ping sur chaqune des adresse ip de liste recuperé dans le fichier hosts
	ping -q -c1 $i > /dev/null
   if [[ $? -eq 1 ]] ; then
   echo "-------------- pas de connection avec $i  ------------- "
             echo "      "
   else
#si non si la connexion est etablie , executer la commande
echo "------la liste des utilisateurs conecté sur $i --------------" ;
           echo $1 | ssh $i 
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
