#!/bin/bash

#CONSTANT
STAKE=100
BET=1

#GENERATE RANDOM NUMBER FOR GAMBLER
randomcheck=$((RANDOM%2))

#CHECK IF WIN OR LOOSE BY $1
cash=$STAKE
if [ $randomcheck -eq $BET ]
then
	((cash++))
else
	((cash--))
fi
echo "Cash: " $cash
