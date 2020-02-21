#!/bin/bash

#CONSTANT
STAKE=100
BET=1
MAXWIN=$(($STAKE+$STAKE/2))
MINLOSS=$(($STAKE/2))

#VARIABLE
cash=0

#FUNCTION TO GET DAILY CASH WIN OR LOOSE
function gambling
{
	cash=$STAKE
	while [[ $cash -ne $MAXWIN  && $cash -ne $MINLOSS ]]
	do
		randomcheck=$((RANDOM%2))
		if [ $randomcheck -eq $BET ]
		then
			((cash++))
		else
			((cash--))
		fi
	done
	echo "Cash: " $cash
}

#FUNCTION CALL
gambling
