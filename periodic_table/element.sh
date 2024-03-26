#!/bin/bash
# Check if an argument was provided

#Create the PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

MAIN()
{
  if [[ ! $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    # is numeric?
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1;")
      if [[ -z $ATOMIC_NUMBER ]]
      then
        NOT_FOUND
      fi
    else
      # first try searching by element symbol
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1';")
      # if we did not get a hit
      if [[ -z $ATOMIC_NUMBER ]]
      then
        #try searching by element name
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1';")
      fi
      # now check if ATOMIC_NUMBER is still empty - then we have not found anything
      if [[ -z $ATOMIC_NUMBER ]]
      then
        NOT_FOUND
      fi
    fi
    # if we end up here we have found an atomic_number which we can use.
    DISPLAY_ELEMENT $ATOMIC_NUMBER
  fi
}

DISPLAY_ELEMENT()
{
  ID=$1
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ID;")
  
  echo $ELEMENT_DATA | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
  exit 0
}

NOT_FOUND()
{
  echo "I could not find that element in the database."
  exit 0
}

MAIN $1