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
function init() {
  local repo_url="https://github.com/ReeperSoul777/lab4"  # Zastąp tym URL swojego repozytorium
  local current_dir=$(pwd)
  
  echo "Klonowanie repozytorium z $repo_url do $current_dir..."
  git clone "$repo_url" "$current_dir"
  
  echo "Dodawanie $current_dir do zmiennej PATH..."
  export PATH=$current_dir:$PATH
  echo 'export PATH='$current_dir':$PATH' >> ~/.bashrc
  echo "Repozytorium zostało sklonowane i ścieżka została dodana do zmiennej PATH."
  }
  
  function error() {
    dir_name="error"
    mkdir -p "$dir_name"
  liczba=$1
  for i in $(seq 1 $liczba); do
    file_name="${dir_name}/error${i}.txt"
    echo -e "Nazwa pliku: $file_name\nNazwa skryptu: $(basename "$0")\nData utworzenia: $(date '+%Y-%m-%d')" > "$file_name"
  done
}

function help() {
  echo "Użycie: $0 [OPCJE]"
  echo "Opcje:"
  echo "  --date, -d            Wyświetla dzisiejszą datę."
  echo "  --error, -e [liczba]  Tworzy określoną liczbę plików error. Domyślnie tworzy 100 plików."
  echo "  --logs, -l [liczba]   Tworzy określoną liczbę plików log. Domyślnie tworzy 100 plików."
  echo "  --help, -h            Wyświetla tę pomoc."
  echo "  --init                Klonuje repozytorium do bieżącego katalogu i ustawia ścieżkę w zmiennej środowiskowej PATH."
}

case "$1" in
  --help|-h) help;;
  --date|-d) dzis;;
  --logs|-l)
    if [ -z "$2" ]; then
      logi 100
    else
      logi "$2"
    fi
    ;;
  --error|-e)
    if [ -z "$2" ]; then
      error 100
    else
      error "$2"
    fi
    ;;
  --init) init;;
  *)
    echo "Nieznana opcja: $1"
    help
    ;;
esac
