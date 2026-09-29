#!/bin/bash

PSQL="psql -U freecodecamp -d salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
SERVICES=$($PSQL "select * from services")

SHOW_SERVICES() {
  echo -e "$1\n"
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED

  SERVICE_SELECTED=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_SELECTED ]]
  then
    SHOW_SERVICES "Alas! Could this service be? Yet even so, it lies beyond our knowledge. Try again."
  fi
}
SHOW_SERVICES "Welcome to this salon wherein I am situated. How can I help you?"

echo "What's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo "That phone number doesn't appear in the customer archives. What's your name?"
  read CUSTOMER_NAME
  INSERT_NEW_CUSTOMER=$($PSQL "insert into customers (phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

echo "When would you like to be a recipient of that service that is $SERVICE_SELECTED, $CUSTOMER_NAME?"
read SERVICE_TIME

INSERT_APPOINTMENT=$($PSQL "insert into appointments (customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo "I have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
