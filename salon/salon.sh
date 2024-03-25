#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~"
PSQL="psql --username=freecodecamp --dbname=salon -t -c"

MAIN_MENU()
{
  #display main menu title or the custom argument received
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi

  #list available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  if [[ -z $AVAILABLE_SERVICES ]]
  then
    echo "\nThere are no available services at this time. Please come back later.\n"
  else
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
    read SERVICE_ID_SELECTED

    #if input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      #send to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      #find service in database
      SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
      #check if empty
      if [[ -z $SERVICE_ID ]]
      then
        #return to main menu
        MAIN_MENU "I could not find that service. What would you like today?"
        
      else
        # Get Service Name
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID;")
        FORMATTED_SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
        
        #ask for phone number
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        #find customer
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
        #customer does not exist
        if [[ -z $CUSTOMER_ID ]]
        then
          #add new customer
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")

          # get customer ID
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
        fi
        
        # Find customers name
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID;")
        FORMATTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
        #ask for time
        echo -e "\nWhat time would you like your $FORMATTED_SERVICE_NAME, $FORMATTED_CUSTOMER_NAME?"
        read SERVICE_TIME

        #insert appointment
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');")

        if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
        then
          echo -e "\nI have put you down for a $FORMATTED_SERVICE_NAME at $SERVICE_TIME, $FORMATTED_CUSTOMER_NAME."
        else
          echo -e "\nI'm afraid something went wrong when I tried to add your appointment\n"
        fi
        
      fi
    fi
  fi
}

MAIN_MENU