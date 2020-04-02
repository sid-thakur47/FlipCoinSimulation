HEAD=1
random=$(($(($RANDOM%2))))
if [ $random -eq $HEAD ]
	then
		echo "Toss result is Head"
	else
		echo "Toss result is Tail"
fi
