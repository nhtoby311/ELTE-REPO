#!/bin/sh

CreateLetter (){
	name=$1
	addr=$2
	date=$3
	newletter=`sed -e 's/<name>/'"$name"'/g' -e 's/<address>/'"$addr"'/g' -e 's/<date>/'"$date"'/g' $letterVar >> Letters.txt`
}
if test $# -eq 2
then
	data=$1
	letterVar=$2
	file=`ls -a | grep "Letters.txt"`
	file2="Letters.txt"
	if [ "$file" = "$file2" ]
	then 
		`rm -r Letters.txt`
	fi
	while IFS='\n' read -r lin
	do
		newline=`echo $lin | sed 's/;/ /g'`
		set -- $newline
		name=$1
		addr=$2
		date=$3
		CreateLetter $name $addr $date
		newline=""
	done < $data
	echo Letters are created in file: Letters.txt
else
	echo Wrong Number of Input Values!
fi

