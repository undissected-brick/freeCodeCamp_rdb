#!/bin/bash
NUMBER=$((RANDOM%1000+1))

PSQL="psql -U freecodecamp -d number_guess --no-align -tc"

NEXT_GUESS() {
	if [[ ! -z $1 ]]
	then
		if [[ $1 -gt $NUMBER ]]
		then
			echo "It's lower than that, guess again:"
		elif [[ $1 -lt $NUMBER ]]
		then
			echo "It's higher than that, guess again:"
		else
			echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
			return 0
		fi
	fi
	read GUESS
	if [[ ! $GUESS =~ ^[0-9]+$ ]]
	then
		echo That is not an integer, guess again:
		NEXT_GUESS
	else
		TRIES=$((TRIES+1))
		NEXT_GUESS $GUESS 
	fi
}

echo Enter your username:
read USERNAME

GAMES=$($PSQL "select games from users where name = '$USERNAME'") 
BEST_SCORE=$($PSQL "select best_score from users where name = '$USERNAME'") 
if [[ -z $GAMES ]]
then
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	_=$($PSQL "insert into users (name,games) values ('$USERNAME',0);")
else
	echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST_SCORE guesses."
fi

TRIES=0
echo Guess the secret number between 1 and 1000:
NEXT_GUESS
if [[ $GAMES -gt 0 && $TRIES -gt $BEST_SCORE ]]
then
	TRIES=$BEST_SCORE
fi
_=$($PSQL "update users set (best_score, games) = ($TRIES, games+1) where name = '$USERNAME'")
