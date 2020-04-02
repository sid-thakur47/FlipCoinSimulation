PERCENT=100
read -p "Enter number of flips:" FLIP

function generateRandom() {
	random=$(($(($RANDOM%2))))	
}

function coinToss() {
generateRandom
	if [ $random -eq 1 ]
	then
		echo "H"
	else
		echo "T"
	fi
}

function getCombination() {
	if [ $flipSide -eq 1 ]
	then
		coinFace="$(coinToss)"
	elif [ $flipSide -eq 2 ]
	then
		coinFace="$(coinToss)$(coinToss)"
	else
		coinFace="$(coinToss)$(coinToss)$(coinToss)"
	fi
	echo $coinFace
}

function calculatePercentage() {
	percent=$(($(($currentValue*$PERCENT))/$FLIP))
	echo $percent
}

function getPercentage() {
	for i in "${!coinToss[@]}"
	do
		currentValue=${coinToss[$i]}
		headTailPercent="$(calculatePercentage)"
		echo "percentage of $i side is $headTailPercent %"
	done
	}

function winningCombination() {
	arrLargest=($(echo ${coinToss[*]}|   tr " " "\n" | sort -nr))
	for k in "${!coinToss[@]}"
	do
	if [ ${arrLargest[0]} -eq ${coinToss[$k]} ] 
	then
		echo "Winning Combination is:"$k
	fi
	done
}

function main() {
	declare -A coinToss
	for ((i=1;i<=$FLIP;i++))
	do
		combination="$(getCombination)"
		coinToss[$combination]=$((${coinToss[$combination]}+1))
	done
	echo "Sides:"${!coinToss[*]} 
	echo "Times:"${coinToss[*]}
	winningCombination
	getPercentage
	unset coinToss
}

function start() {
	for ((j=1;j<=3;j++))
	do
		flipSide=$j
		main
	done
}
start
