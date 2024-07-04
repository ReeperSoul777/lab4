#!/bin/bash

function dzis() {
  echo "Dzisiejsza data: $(date '+%Y-%m-%d')"
}

function logi() {
  liczba=$1
  for i in $(seq 1 $liczba); do
    file_name="log${i}.txt"
    echo -e "Nazwa pliku: $file_name\nNazwa skryptu: $(basename "$0")\nData utworzenia: $(date '+%Y-%m-%d')" > "$file_name"
  done
}

function help() {
  echo "Użycie: $0 [OPCJE]"
  echo "Opcje:"
  echo "  --date, -d            Wyświetla dzisiejszą datę."
  echo "  --logs, -l [liczba]   Tworzy określoną liczbę plików log. Domyślnie tworzy 100 plików."
  echo "  --help, -h            Wyświetla tę pomoc."
}

case "$1" in
  --help|-h) help;;
  --date|-d) dzis;;
  --logs|-l)
    if [ -z "$3" ]; then
      logi 100
    else
      logi "$3"
    fi
    ;;
  *)
    echo "Nieznana opcja: $1"
    help
    ;;
esac
