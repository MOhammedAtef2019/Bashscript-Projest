#!/bin/bash

function mainMenue {
    select option in "Create Database" "List Databases" "Connect To Databases" "Drop Database " "Quite" 
    do 
        case $REPLY in 
        1) createNewDatabase;;
              
        2) listAllDatabase;; 

        3) connectToDatabase;;

     	4) dropDatabase;;

        5) echo -e "\t\tGoogbye"
              exit ;;

        *) echo " Please Select from menu " ; mainMenue;
        esac
    done
}
 #check of DBMS exist
function checkDBMS {
    if [ -d "DBMS" ]
    then
        echo -e "\t\twelcome to DBMS "
    else
        mkdir DBMS 
        echo -e "\t\twelcome to DBMS for first use " 
    fi
        mainMenue
}

function createNewDatabase {
  read -p "Please Enter Database Name :" DSName
    if [[ $DSName == "" ]]
    then
        echo "please enter name"
    elif [ -d "DBMS/$DSName" ]
    then
         echo "Database already exist"
    else
    mkdir  DBMS/$DSName 
        echo "Database created successfully" 
    fi
        mainMenue
}

function listAllDatabase {
    listCount=$(ls DBMS|wc -l)
    if [ $listCount -eq 0 ]
    then
    echo "there no database created"
    else
    echo "list of your own database"
    ls DBMS
    echo "There are $listCount created databases"
    fi
    mainMenue
}

function dropDatabase {
  read -p "Please Enter Database Name to drop it :" DSName
    if [ -d "DBMS/$DSName" ]
    then
         rm -ir  DBMS/$DSName 
         echo "Database deleted successfully"
        
    else
        echo "Database not exist" 
    fi
        mainMenue

}

function connectToDatabase {
  read -p "Please Enter Database Name to connect to :" DSName
    if [ -d "DBMS/$DSName" ]
    then
         echo "Database connected successfully"
         cd  DBMS/$DSName 
         ./newTables.sh
        
    else
        echo "Database not exist" 
    fi

}



checkDBMS