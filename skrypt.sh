#!/bin/bash
function dzis(){
echo "Dzisiejsza data: $(date '+%Y-%m-%d')"
}
function logi(){
	for i in $(seq 1 100); do
    		file_name="log${i}.txt"
    		echo -e "Nazwa pliku: $file_name\nNazwa skryptu: $(basename "$0")\nData utworzenia: $(date '+%Y-%m-%d')" > "$file_name"
 	done

}



case "$1" in
--date) dzis;;
--log) logi;;

esac
