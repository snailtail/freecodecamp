#!/bin/bash
# create PSQL variable for use in the code.
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"
SECRET_NUMBER=$(($RANDOM%1000 + 1))
MAIN()
{
  echo -e "\nEnter your username:\n"
  read USERNAME
  USER_DATA=$($PSQL "SELECT username, count(guesses) as guess_count, min(guesses) as min_guess FROM users INNER JOIN games using(user_id) WHERE username='$USERNAME' GROUP BY username;")
  #check if empty = first time user
  if [[ -z $USER_DATA ]]
  then
    # Greet new user and insert into database
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username) VALUES('$USERNAME');")
  else
    echo $USER_DATA | while read USERNAME BAR GUESS_COUNT BAR MIN_GUESS
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GUESS_COUNT games, and your best game took $MIN_GUESS guesses."
    done
  fi

  # init a user_guess variable
  USER_GUESS=-1
  NUMBER_OF_GUESSES=0
  echo -e "\nGuess the secret number between 1 and 1000:"
  while [ $USER_GUESS -ne $SECRET_NUMBER ]
  do
    read USER_GUESS
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
    #test if it's an integer
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      USER_GUESS=-1
    else
      # test if users guess is higher
      if [[ $USER_GUESS > $SECRET_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $USER_GUESS < $SECRET_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        #congratulations user!
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        # get the user_id for this user
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'";)
        # insert game results
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID,$NUMBER_OF_GUESSES);")
      fi
    fi
  done
  
}

MAIN