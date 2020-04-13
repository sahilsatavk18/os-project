#!/bin/bash

while :
do
clear
echo "Welcome to Phone Directory"
echo "1.Add a contact"
echo "2.Search a contact"
echo "3.Delete a contact"
echo "4.View Phone Directory"
echo "5.Quit"
read -p "Enter your choice " usr_cmd
clear

case $usr_cmd in
1)echo "Add New Contact"
  read -p "Enter Name- " name
echo "Got That!"
read -p "Enter Number- " number
clear
echo "New Contact Info:"
echo "-> Name: $name. -> Number: $number"
echo "$name : $number" >> phonedir.log
echo "Saved Successfully"
;;
2)echo "Search Contact"
read -p "Enter the name- " search_query
clear
echo "Search Results:"
grep -i $search_query phonedir.log
;;
3)echo "Delete Contact"
read -p "Enter name to be deleted(case-sensitive):" delete_string
sed -i -e "/$delete_string/d" phonedir.log
echo "Deleted Successfully"
;;
4)echo "PHONE DIRECTORY"
echo " "
cat phonedir.log
;;
5)break;;
*)echo"INVALID OPTION";;
esac;

read -p "Press 5 to quit, Anything else to return to main menu" confirm_exit
if [ $confirm_exit -eq 5 ]
then break
fi
done
