if [[ ! $1 ]]
then
  echo Please provide an element as an argument.
else
  PSQL="psql -U freecodecamp -d periodic_table -tc"
  if [[ $1 =~ ^[0-9]*$ ]]
  then    
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1" | sed 's/ //g')
  else
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$1' or name like '$1'" | sed 's/ //g')
  fi
  if [[ ! $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
    ELEM_DATA=$($PSQL "select name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from properties join elements using (atomic_number) join types using (type_id) where atomic_number = $ATOMIC_NUMBER")
    echo $ELEM_DATA | 
      (read NAME _ SYMBOL _ TYPE _ MASS _ MELTING _ BOILING
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      )
  fi
fi
