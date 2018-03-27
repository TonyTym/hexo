#!/bin/sh
colorEcho(){
	if [ ! -n "$1" ];then
		echo "string is required"
		exit
	fi	

	if [ ! -n "$2" ];then
		color=1
	else
		color=$2
	fi
 	
 	case $color in
 		1) echo "\033[32;1m $1 \033[0m" #green
		;;
		2) echo "\033[30;1m $1 \033[0m" #black
		;;
		3) echo "\033[31;5;1m $1 \033[0m" #red
		;;
		4) echo "\033[33;1m $1 \033[0m" #yellow
		;;
		5) echo "\033[34;1m $1 \033[0m" #blue
		;;
		6) echo "\033[35;1m $1 \033[0m" #purpule
		;;
		7) echo "\033[37;1m $1 \033[0m" #white
		;;
		8) echo "\033[36;1m $1 \033[0m" #sky blue
		;;	
	esac
}

colorEcho "............  start  ............\n"

rm -f db.json

colorEcho "............  rm -f db.json  ............\n"

hexo clean

colorEcho "............  hexo clean  ............\n"

hexo g

colorEcho "............  hexo g  ............\n"

hexo d

colorEcho "............  hexo d  ............\n"

colorEcho "............  end  ............"



