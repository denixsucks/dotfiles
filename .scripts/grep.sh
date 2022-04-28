#!/bin/sh
#packages= ripgrep for better grep, parallel for multithread
FOLDER=""
KEYWORD=""
c_red="\033[1;31m"
c_yellow="\033[1;33m"
c_magenta="\033[1;35m"
c_cyan="\033[1;36m"
clear
printf "\n${c_cyan}Grep Script"
printf "\n"
printf "\n${c_magenta}Aramak istediginiz dosyalarin dizin konumunu giriniz (orn: /home/user/folder1/): "
read FOLDER
printf "\n${c_red}Aramak istediginiz keywordu giriniz : "
read KEYWORD
clear
sleep 1
printf "\n${c_cyan}Arama yapiliyor..."
printf "\n${c_yellow}"
sleep 1
find $FOLDER -type f | parallel rg -FHwni $KEYWORD {}
