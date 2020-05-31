#!/bin/bash


echo "a opció: ability.txt-be menti és kiírja mit csinál egy adott képesség az id-je alapján. [1-233]"
echo "t opció: type.txt-be menti és kiírja hogy az adott pokémon típushoz hány pokémon tartozik id. [1-17]"
echo "n opció: name.txt-be menti és kiírja a id-je alapján megkeresett pokémon nevét. [1-807] "

while getopts t:a:n: options; do
 case $options in
	t) typeid=$OPTARG
	curl "https://pokeapi.co/api/v2/type/"$typeid | tr ',' "\n" | grep -c "pokemon" > type.txt
	cat type.txt ;;
	a) abilityid=$OPTARG
	curl "https://pokeapi.co/api/v2/ability/"$abilityid | tr ',' "\n" | grep '"effect_entries":' > ability.txt
	cat ability.txt ;;
	n) pokeid=$OPTARG
	curl "https://pokeapi.co/api/v2/pokemon/"$pokeid | tr ',' "\n" | grep 'forms' | cut -c 18-> name.txt
	cat name.txt ;;
 esac
done

