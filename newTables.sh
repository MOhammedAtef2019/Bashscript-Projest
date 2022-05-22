#!/bin/bash

function tablesMenue {
    select option in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Return To Main Manue" "Quite" 
    do 
        case $REPLY in 
        1) reate Table;;
              
        2) List Tables;; 

        3) Drop Table;;

     	4) Insert into Table;;

        5) Select From Table;;

        6) Delete From Table;;

        7) ./newDBMS.sh;; 

        8) echo -e "\t\tGoogbye"
              exit ;;

        *) echo " Please Select from menu " ; tablesMenue;
        esac
    done
}
tablesMenue