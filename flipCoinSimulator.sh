PERCENT=100
read -p "Enter number of flips:" flip

function generateRandom() {
random=$(($(($RANDOM%2))))
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
			coinFace="$(generateRandom)"
		elif [ $flipSide -eq 2 ]
			then
			coinFace="$(generateRandom)$(generateRandom)"
		else
			coinFace="$(generateRandom)$(generateRandom)""$(generateRandom)"
	fi
	echo $coinFace
}

function calculatePercentage() {
	percent=$(($(($currentValue*$PERCENT))/$flip))
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

function findWinCombination() {
maxValue=0
key=1
	for i in "${!coinToss[@]}"
		do
		if [ ${coinToss[$i]} -gt $maxValue ]
			then
			maxValue=${coinToss[$i]}
			key=$i
		fi
	done
echo "Winning Combination is: "$key

}

function main() {
	declare -A coinToss
	for ((i=1;i<=$flip;i++))
		do
			combination="$(getCombination)"
			coinToss[$combination]=$((${coinToss[$combination]}+1))
	done
	echo "Sides:"${!coinToss[*]} 
	echo "Times:"${coinToss[*]}
	getPercentage
	findWinCombination
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
