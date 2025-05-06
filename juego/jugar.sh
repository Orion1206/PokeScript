#!/bin/bash

clear

usu=$(whoami)
ubi=$(find /home/$usu/ -name "juego")

source $ubi/funciones.sh

declare -a opcs=("Ver_datos" "Entrenar" "Combatir" "Desafiar_a_Arceus" "Guardar_Partida" "Salir")
declare -a tipos=("Bicho" "Siniestro" "Dragon" "Electrico" "Hada" "Lucha" "Fuego" "Volador" "Fantasma" "Planta" "Tierra" "Hielo" "Normal" "Veneno" "Psiquico" "Roca" "Acero" "Agua")
function fmenu (
	pos=0
	for i in ${opcs[@]};do
		if [ $pos -eq 0 ];then
			if [ $sit -eq 1 ];then
				fcolores $7 = = = = = = = =
				fcolores $1 $i
				fcolores $7 = = = = = = = =
			else
				fcolores $1 $i
			fi
		elif [ $pos -eq 1 ];then
			if [ $sit -eq 2 ];then
				fcolores $7 = = = = = = = =
				fcolores $2 $i
				fcolores $7 = = = = = = = =
			else
				fcolores $2 $i
			fi
		elif [ $pos -eq 2 ];then
			if [ $sit -eq 3 ];then
				fcolores $7 = = = = = = = =
				fcolores $3 $i
				fcolores $7 = = = = = = = =
			else
				fcolores $3 $i
			fi
		elif [ $pos -eq 3 ];then
			if [ $sit -eq 4 ];then
				fcolores $7 = = = = = = = =
				fcolores $4 $i
				fcolores $7 = = = = = = = =
			else
				fcolores $4 $i
			fi
		elif [ $pos -eq 4 ];then
			if [ $sit -eq 5 ];then
				fcolores $7 = = = = = = = =
				fcolores $5 $i
				fcolores $7 = = = = = = = =
			else
				fcolores $5 $i
			fi
		else [ $pos -eq 5 ]
			if [ $sit -eq 6 ];then
				fcolores $7 = = = = = = = =
				fcolores $6 $i
				fcolores $7 = = = = = = = =
			else
				fcolores $6 $i
			fi
		fi
		pos=$(($pos+1))
	done
)

porc=0
while [ $porc -le 100 ];do
	if [ $porc -le 25 ];then
		echo -e Cargando juego ..... "\e[31m $porc%\e[0m"
	elif [ $porc -le 75 ];then
		echo -e Cargando juego ..... "\e[33m $porc%\e[0m"
	elif [ $porc -lt 100 ];then
		echo -e Cargando juego ..... "\e[32m $porc%\e[0m"
	else
		fvaca "¡¡DISFRUTA!!"
		sleep 1
	fi
	sleep 0.1
	clear
	porc=$(($porc+1))
done

nom=$(cat $ubi/nombre.txt)
rm $ubi/nombre.txt
lvl=$1
sex=$2
tip=$3

clear

sit=1
int=1
compl=""
while true;do
	tput civis

	while true;do
		case $sit in
			1)
			fmenu 44 33 33 33 32 31 30
			;;
			2)
			fmenu 33 44 33 33 32 31 30
			;;
			3)
			fmenu 33 33 44 33 32 31 30
			;;
			4)
			fmenu 33 33 33 44 32 31 30
			;;
			5)
			fmenu 33 33 33 33 44 31 30
			;;
			6)
			fmenu 33 33 33 33 32 44 30
			;;
		esac

		read -s -n 1 tecla

		if [ -z $tecla ];then
			op=$sit
			break
		elif [ $tecla = "w" ];then
			if [ $sit -eq 1 ];then
				sit=6
			else
				sit=$(($sit-1))
			fi
		elif [ $tecla = "s" ];then
			if [ $sit -eq 6 ];then
				sit=1
			else
				sit=$((sit+1))
			fi
		else
			sit=$sit
		fi
		clear
	done

	tput cnorm

	case $sit in
		1)
		clear
		echo Nombre: $nom
		echo Nivel: $lvl
		echo Sexo: $sex
		echo Tipo: $tip
		echo Medalla: $compl
		;;
		2)
		clear
		echo "Entrenando...."
		sleep 2
		if [ $lvl -lt 100 ];then
			ns=$(shuf -i 1-4 -n 1)
			lvl=$(($lvl+$ns))
			echo Has subido $ns niveles
		else
			fcolores 31 No puedes ni subir mas niveles
		fi
		if [ $lvl -gt 100 ];then
			lvl=100
		fi
		;;
		3)
		clear
		if [ $lvl -le 10 ];then
			lvlemin=0
		else
			lvlemin=$(($lvl-10))
		fi
		if [ $lvl -gt 90 ];then
			lvlemax=100
		else
			lvlemax=$(($lvl+10))
		fi
		lvle=$(shuf -i $lvlemin-$lvlemax -n 1)
		arrayr=$(shuf -i 0-17 -n 1)
		echo "HA APARECIDO UN POKEMON SALVAJE DE TIPO ${tipos[$arrayr]} Y NIVEL $lvle"
		source $ubi/combate.sh $lvl $lvle $tip ${tipos[$arrayr]}
		if [ $resultado -eq 1 ];then
			ns=$(shuf -i 5-15 -n 1)
			lvl=$(($lvl+$ns))
			if [ $lvl -gt 100 ];then
				lvl=100
				echo "NIVEL MAXIMO"
			else
				echo "Has subido $ns niveles"
			fi
		else
			echo "No ganas nada :("
		fi
		;;
		4)
		clear
		if [ $int -eq 1 ];then
			echo "Si inicias este combate y pierdes no podras reintentarlo"
			read -p "¿Deseas empezarla (S/n) " emp
			if [ -z $emp ] || [ $emp = "s" ] || [ $emp = "S" ];then
				source $ubi/combate.sh $lvl 200 $tip Normal
			fi
			if [ $resultado -eq 1 ];then
				fcolores 32 ¡¡¡HAS GANADO!!!
				fvaca ENHORABUENA Y OBTIENES LA MEDALLA
				compl=$(echo -e "\e[92m \U1F600 \e[0m")
				int=0
			else
				fcolores 31 GAME OVER
				int=0
			fi
		else
			echo "Ya has realizado este combate, no puedes volver a intentarlo."
		fi
		;;
		5)
		clear
		echo Nombre: $nom > $ubi/partidas/partida_$nom.txt
		echo Nivel: $lvl >> $ubi/partidas/partida_$nom.txt
		echo Sexo: $sex >> $ubi/partidas/partida_$nom.txt
		echo Tipo: $tip >> $ubi/partidas/partida_$nom.txt
		if [ $resultado -eq 1 ];then
			echo Medalla: $compl >> $ubi/partidas/partida_$nom.txt
		else
			echo Medalla: NO OBTENIDA >> $ubi/partida_$nom.txt
		fi
		;;
	esac

	if [ $sit -gt 4 ];then
		break
	fi
done
