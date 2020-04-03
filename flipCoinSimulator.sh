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
	else
		coinFace="$(coinToss)$(coinToss)"
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

function computeCoinToss() {
	declare -A coinToss
		for ((i=1;i<=$FLIP;i++))
			do
			combination="$(getCombination)"
			coinToss[$combination]=$((${coinToss[$combination]}+1))
		done
		echo "Sides:"${!coinToss[*]} 
		echo "Times:"${coinToss[*]}
		getPercentage
		unset coinToss
}
flipSide=1
computeCoinToss
flipSide=2
computeCoinToss
