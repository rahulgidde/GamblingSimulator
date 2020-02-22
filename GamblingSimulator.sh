#!/bin/bash

#CONSTANT
STAKE=100
BET=1
MAXWIN=$(($STAKE+$STAKE/2))
MINLOSS=$(($STAKE/2))
NUMBER_OF_DAYS=30

#VARIABLE
cash=0

#DECLARE DICTIONARY
declare -A dailyCash
declare -A totalCashPerDay

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
	echo $cash
}

#FUNCTION TO GET LUCKIEST DAY AND UNLUCKIEST DAY
function sorting()
{
	for k in ${!totalCashPerDay[@]}
	do
		echo $k '-' ${totalCashPerDay[$k]}
	done |  sort -rn -k3
}

#CALCULATING STAKE FOR A MONTH
for (( day=1; day<=$NUMBER_OF_DAYS; day++ ))
do
	cashPerDay=$(gambling)
	cashPerDay=$(($cashPerDay - $STAKE))
	dailyCash[Day$day]=$cashPerDay
	totalCash=$(($totalCash+$cashPerDay))
	if [ $cashPerDay -gt 0 ]
	then
		echo "Day$day  win  :" $cashPerDay
	else
		echo "Day$day  loose:" $cashPerDay
	fi
	totalCashPerDay[Day$day]=$totalCash
done
echo "Total cash for 30 days:"$totalCash
echo "Luckiest "$(sorting | head -1)
echo "Unluckiest "$(sorting | tail -1)


