#!/bin/bash

usu=$(whoami)
ubi=$(find /home/$usu/ -name "juego")

source $ubi/funciones.sh

declare -a opcs=("Bicho" "Siniestro" "Dragon" "Electrico" "Hada" "Lucha" "Fuego" "Volador" "Fantasma" "Planta" "Tierra" "Hielo" "Normal" "Veneno" "Psiquico" "Roca" "Acero" "Agua")

function fpmenu (
	pos=0
	for e in ${opcs[@]};do
		if [ $pos -eq 0 ];then
			if [ $sit -eq 1 ];then
				fcolores ${19} = = = = = = = =
				fcolores $1 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $1 $e
			fi
		elif [ $pos -eq 1 ];then
			if [ $sit -eq 2 ];then
				fcolores ${19} = = = = = = = =
				fcolores $2 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $2 $e
			fi
		elif [ $pos -eq 2 ];then
			if [ $sit -eq 3 ];then
				fcolores ${19} = = = = = = = =
				fcolores $3 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $3 $e
			fi
		elif [ $pos -eq 3 ];then
			if [ $sit -eq 4 ];then
				fcolores ${19} = = = = = = = =
				fcolores $4 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $4 $e
			fi
		elif [ $pos -eq 4 ];then
			if [ $sit -eq 5 ];then
				fcolores ${19} = = = = = = = =
				fcolores $5 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $5 $e
			fi
		elif [ $pos -eq 5 ];then
			if [ $sit -eq 6 ];then
				fcolores ${19} = = = = = = = =
				fcolores $6 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $6 $e
			fi
		elif [ $pos -eq 6 ];then
			if [ $sit -eq 7 ];then
				fcolores ${19} = = = = = = = =
				fcolores $7 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $7 $e
			fi
		elif [ $pos -eq 7 ];then
			if [ $sit -eq 8 ];then
				fcolores ${19} = = = = = = = =
				fcolores $8 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $8 $e
			fi
		elif [ $pos -eq 8 ];then
			if [ $sit -eq 9 ];then
				fcolores ${19} = = = = = = = =
				fcolores $9 $e
				fcolores ${19} = = = = = = = =
			else
				fcolores $9 $e
			fi
		elif [ $pos -eq 9 ];then
			if [ $sit -eq 10 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${10} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${10} $e
			fi
		elif [ $pos -eq 10 ];then
			if [ $sit -eq 11 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${11} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${11} $e
			fi
		elif [ $pos -eq 11 ];then
			if [ $sit -eq 12 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${12} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${12} $e
			fi
		elif [ $pos -eq 12 ];then
			if [ $sit -eq 13 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${13} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${13} $e
			fi
		elif [ $pos -eq 13 ];then
			if [ $sit -eq 14 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${14} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${14} $e
			fi
		elif [ $pos -eq 14 ];then
			if [ $sit -eq 15 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${15} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${15} $e
			fi
		elif [ $pos -eq 15 ];then
			if [ $sit -eq 16 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${16} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${16} $e
			fi
		elif [ $pos -eq 16 ];then
			if [ $sit -eq 17 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${17} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${17} $e
			fi
		else
			if [ $sit -eq 18 ];then
				fcolores ${19} = = = = = = = =
				fcolores ${18} $e
				fcolores ${19} = = = = = = = =
			else
				fcolores ${18} $e
			fi
		fi
		pos=$(($pos+1))
	done
)

sit=1

while true;do
	tput civis

	while true;do
		case $sit in
			1)
			fpmenu 44 90 36 33 35 91 31 94 36 92 37 96 90 97 35 37 90 34 30
			;;
			2)
			fpmenu 32 44 36 33 35 91 31 94 36 92 37 96 90 97 35 37 90 34 30
			;;
			3)
			fpmenu 32 90 44 33 35 91 31 94 36 92 37 96 90 97 35 37 90 34 30
			;;
			4)
			fpmenu 32 90 36 44 35 91 31 94 36 92 37 96 90 97 35 37 90 34 30
			;;
			5)
			fpmenu 32 90 36 33 44 91 31 94 36 92 37 96 90 97 35 37 90 34 30
			;;
			6)
			fpmenu 32 90 36 33 35 44 31 94 36 92 37 96 90 97 35 37 90 34 30
			;;
			7)
			fpmenu 32 90 36 33 35 91 44 94 36 92 37 96 90 97 35 37 90 34 30
			;;
			8)
			fpmenu 32 90 36 33 35 91 31 44 36 92 37 96 90 97 35 37 90 34 30
			;;
			9)
			fpmenu 32 90 36 33 35 91 31 94 44 92 37 96 90 97 35 37 90 34 30
			;;
			10)
			fpmenu 32 90 36 33 35 91 31 94 36 44 37 96 90 97 35 37 90 34 30
			;;
			11)
			fpmenu 32 90 36 33 35 91 31 94 36 92 44 96 90 97 35 37 90 34 30
			;;
			12)
			fpmenu 32 90 36 33 35 91 31 94 36 92 37 44 90 97 35 37 90 34 30
			;;
			13)
			fpmenu 32 90 36 33 35 91 31 94 36 92 37 96 44 97 35 37 90 34 30
			;;
			14)
			fpmenu 32 90 36 33 35 91 31 94 36 92 37 96 90 44 35 37 90 34 30
			;;
			15)
			fpmenu 32 90 36 33 35 91 31 94 36 92 37 96 90 97 44 37 90 34 30
			;;
			16)
			fpmenu 32 90 36 33 35 91 31 94 36 92 37 96 90 97 35 44 90 34 30
			;;
			17)
			fpmenu 32 90 36 33 35 91 31 94 36 92 37 96 90 97 35 37 44 34 30
			;;
			18)
			fpmenu 32 90 36 33 35 91 31 94 36 92 37 96 90 97 35 37 90 44 30
			;;
		esac
		read -s -n 1 tecla
		if [ -z $tecla ];then
			op=$sit
			break
			clear
		elif [ $tecla = "w" ];then
			if [ $sit -eq 1 ];then
				sit=18
			else
				sit=$(($sit-1))
			fi
		elif [ $tecla = "s" ];then
			if [ $sit -eq 18 ];then
				sit=1
			else
				sit=$(($sit+1))
			fi
		else
			sit=$sit
		fi
		clear
	done

	tput cnorm

	case $sit in
		1)
		tip=${opcs[0]}
		;;
		2)
		tip=${opcs[1]}
		;;
		3)
		tip=${opcs[2]}
		;;
		4)
		tip=${opcs[3]}
		;;
		5)
		tip=${opcs[4]}
		;;
		6)
		tip=${opcs[5]}
		;;
		7)
		tip=${opcs[6]}
		;;
		8)
		tip=${opcs[7]}
		;;
		9)
		tip=${opcs[8]}
		;;
		10)
		tip=${opcs[9]}
		;;
		11)
		tip=${opcs[10]}
		;;
		12)
		tip=${opcs[11]}
		;;
		13)
		tip=${opcs[12]}
		;;
		14)
		tip=${opcs[13]}
		;;
		15)
		tip=${opcs[14]}
		;;
		16)
		tip=${opcs[15]}
		;;
		17)
		tip=${opcs[16]}
		;;
		18)
		tip=${opcs[17]}
	 	;;
	esac

	break
done

echo $tip > $ubi/tipo.txt
