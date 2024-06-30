#!/bin/bash
function dzis(){
echo "Dzisiejsza data: $(date '+%Y-%m-%d')"
}








case "$1" in
--date) dzis;;
esac
