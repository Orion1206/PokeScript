#!/bin/bash

clear

usu=$(whoami)
ubi=$(find /home/$usu/ -name "juego")

source $ubi/funciones.sh

declare -a opcs=("Ver_datos" "Cambiar_nombre" "Cambiar_nivel" "Cambiar_sexo" "Cambiar_tipo" "Comenzar" "Cancelar")

function fmenu (
	pos=0
	for i in ${opcs[@]};do
		if [ $pos -eq 0 ];then
			if [ $sit -eq 1 ];then
				fcolores $8 = = = = = = = =
				fcolores $1 $i
				fcolores $8 = = = = = = = =
			else
				fcolores $1 $i
			fi
		elif [ $pos -eq 1 ];then
			if [ $sit -eq 2 ];then
				fcolores $8 = = = = = = = =
				fcolores $2 $i
				fcolores $8 = = = = = = = =
			else
				fcolores $2 $i
			fi
		elif [ $pos -eq 2 ];then
			if [ $sit -eq 3 ];then
				fcolores $8 = = = = = = = =
				fcolores $3 $i
				fcolores $8 = = = = = = = =
			else
				fcolores $3 $i
			fi
		elif [ $pos -eq 3 ];then
			if [ $sit -eq 4 ];then
				fcolores $8 = = = = = = = =
				fcolores $4 $i
				fcolores $8 = = = = = = = =
			else
				fcolores $4 $i
			fi
		elif [ $pos -eq 4 ];then
			if [ $sit -eq 5 ];then
				fcolores $8 = = = = = = = =
				fcolores $5 $i
				fcolores $8 = = = = = = = =
			else
				fcolores $5 $i
			fi
		elif [ $pos -eq 5 ];then
			if [ $sit -eq 6 ];then
				fcolores $8 = = = = = = = =
				fcolores $6 $i
				fcolores $8 = = = = = = = =
			else
				fcolores $6 $i
			fi
		else
			if [ $sit -eq 7 ];then
				fcolores $8 = = = = = = = =
				fcolores $7 $i
				fcolores $8 = = = = = = = =
			else
				fcolores $7 $i
			fi
		fi
		pos=$(($pos+1))
	done
)

declare -A datos

read -p "Introduce nombre: " nom
while [ -z "$nom" ];do
	fcolores 31 Nombre invalido
	read -p "Introduce nombre: " nom
done

read -p "Introduce nivel (1-100): " lvl
while [ -z $lvl ] || [ $lvl -le 0 ] || [ $lvl -gt 100 ];do
	fcolores 31 Nivel invalido
	read -p "Introduce nivel: " lvl
done

sex=z
while [ -z "$sex" ] || [ "$sex" != "h" ] && [ "$sex" != "m" ];do
	read -p "Introduce Sexo (m/h): " sex
	if [ -z $sex ];then
		fcolores 31 ERROR
	elif [ $sex = "h" ];then
		sex=$(fcolores 35 Hembra)
		break
	elif [ $sex = "m" ];then
		sex=$(fcolores 34 Macho)
		break
	else
		fcolores 31 ERROR
	fi
done

echo "Introduce Tipo: "
bash $ubi/pktipos.sh
tip=$(cat $ubi/tipo.txt)
rm $ubi/tipo.txt

clear

datos[nombre]=$nom
datos[nivel]=$lvl
datos[sexo]=$sex
datos[tipo]=$tip

sit=1

while true;do
	tput civis

	while true;do
		case $sit in
			1)
			fmenu 44 33 33 33 33 32 31 30
			;;
			2)
			fmenu 33 44 33 33 33 32 31 30
			;;
			3)
			fmenu 33 33 44 33 33 32 31 30
			;;
			4)
			fmenu 33 33 33 44 33 32 31 30
			;;
			5)
			fmenu 33 33 33 33 44 32 31 30
			;;
			6)
			fmenu 33 33 33 33 33 44 31 30
			;;
			7)
			fmenu 33 33 33 33 33 32 44 30
			;;
		esac

		read -s -n 1 tecla

		if [ -z $tecla ];then
			op=$sit
			break
		elif [ $tecla = "w" ];then
			if [ $sit -eq 1 ];then
				sit=7
			else
				sit=$(($sit-1))
			fi
		elif [ $tecla = "s" ];then
			if [ $sit -eq 7 ];then
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
		echo Nombre: ${datos[nombre]}
		echo Nivel: ${datos[nivel]}
		echo Sexo: ${datos[sexo]}
		echo Tipo: ${datos[tipo]}
		;;
		2)
		clear
		while true;do
			read -p "Introduce el nombre nuevo: " nom
			if [ -z $nom ];then
				fcolores 31 Nombre invalido
			else
				break
			fi
		done
		datos[nombre]=$nom
		;;
		3)
		clear
		while true;do
			read -p "Introduce el nuevo nivel: " lvl
			if [ -z $lvl ] || [ $lvl -lt 1 ] || [ $lvl -gt 100 ];then
				fcolores 31 Edad invalida
			else
				break
			fi
		done
		datos[nivel]=$lvl
		;;
		4)
		clear
		while true;do
			read -p "Introduce Sexo (m/h): " sex
			if [ -z $sex ] || [ $sex != "h" ] && [ $sex != "m" ];then
				fcolores 31 ERROR
			elif [ $sex = "h" ];then
				sex=$(fcolores 35 Hembra)
				break
			elif [ $sex = "m" ];then
				sex=$(fcolores 34 Macho)
				break
			fi
		done
		datos[sexo]=$sex
		;;
		5)
		clear
		echo "Introduce el nuevo tipo: "
		bash $ubi/pktipos.sh
		tip=$(cat $ubi/tipo.txt)
		datos[tipo]=$tip
		;;
		6)
		echo ${datos[nombre]} > $ubi/nombre.txt
		bash $ubi/jugar.sh ${datos[nivel]} ${datos[sexo]} ${datos[tipo]}
		;;
	esac

	if [ $sit -gt 5 ];then
		break
	fi
done
