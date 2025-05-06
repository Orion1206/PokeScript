#!/bin/bash

usu=$(whoami)
ubi=$(find /home/$usu/ -name "juego")

source $ubi/funciones.sh

if [ $1 -eq 1 ];then
	hp1=50
elif [ $1 -lt 100 ];then
	hp1=$((50+5*$1))
else
	hp1=500
fi

if [ $2 -eq 1 ];then
	hpe1=50
elif [ $2 -lt 100 ];then
	hpe1=$((50+5*$1))
elif [ $2 -eq 200 ];then
	hpe1=700
else
	hpe1=500
fi

na1=$(shuf -i 1-20 -n 1)
na2=$(shuf -i 1-20 -n 1)
na3=$(shuf -i 20-25 -n 1)
na4=$(shuf -i 65-75 -n 1)

if [ $hpe1 -ne 700 ];then
	hpe1=$(($hp1-$na1+$na2))
fi

hp2=$hp1
hpe2=$hpe1

function fvida (
	if [ $hp2 -le $(($hp1/4)) ] && [ $hpe2 -le $(($hpe1/4)) ];then
		echo -e "\e[31m$hp2/\e[32m$hp1\e[0m vs \e[31m$hpe2/\e[32m$hpe1\e[0m"
	elif [ $hp2 -le $(($hp1/4)) ] && [ $hpe2 -le $(($hpe1/2)) ];then
		echo -e "\e[31m$hp2/\e[32m$hp1\e[0m vs \e[33m$hpe2/\e[32m$hpe1\e[0m"
	elif [ $hp2 -le $(($hp1/4)) ];then
		echo -e "\e[31m$hp2/\e[32m$hp1\e[0m vs \e[32m$hpe2/\e[32m$hpe1\e[0m"
	elif [ $hp2 -le $(($hp1/2)) ] && [ $hpe2 -le $(($hpe1/4)) ];then
		echo -e "\e[33m$hp2/\e[32m$hp1\e[0m vs \e[31m$hpe2/\e[32m$hpe1\e[0m"
	elif [ $hp2 -le $(($hp1/2)) ] && [ $hpe2 -le $(($hpe1/2)) ];then
		echo -e "\e[33m$hp2/\e[32m$hp1\e[0m vs \e[33m$hpe2/\e[32m$hpe1\e[0m"
	elif [ $hp2 -le $(($hp1/2)) ];then
		echo -e "\e[33m$hp2/\e[32m$hp1\e[0m vs \e[32m$hpe2/\e[32m$hpe1\e[0m"
	elif [ $hpe2 -le $(($hpe1/4)) ];then
		echo -e "\e[32m$hp2/\e[32m$hp1\e[0m vs \e[31m$hpe2/\e[32m$hpe1\e[0m"
	elif [ $hpe2 -le $(($hpe1/2)) ];then
		echo -e "\e[32m$hp2/\e[32m$hp1\e[0m vs \e[33m$hpe2/\e[32m$hpe1\e[0m"
	else
		echo -e "\e[32m$hp2/\e[32m$hp1\e[0m vs \e[32m$hpe2/\e[32m$hpe1\e[0m"
	fi
)


mirar=$(cat $ubi/tablatipos.txt | grep ^$3 | cut -d ":" -f 2)

cont=1
while true;do
	mirar2=$(echo $mirar | cut -d ";" -f $cont | cut -d "=" -f 1)
	if [ -z $mirar2 ];then
		break
	else
		if [ $mirar2 = $4 ];then
			mult=$(echo $mirar | cut -d ";" -f $cont | cut -d "=" -f 2)
			break
		else
			mult=1
		fi
	fi
	cont=$(($cont+1))
done

mirar=$(cat $ubi/tablatipos.txt | grep ^$4 | cut -d ":" -f 2)

cont=1
while true;do
	mirar2=$(echo $mirar | cut -d ";" -f $cont | cut -d "=" -f 1)
	if [ -z $mirar2 ];then
		break
	else
		if [ $mirar2 = $3 ];then
			multe=$(echo $mirar | cut -d ";" -f $cont | cut -d "=" -f 2)
			break
		else
			multe=1
		fi
	fi
	cont=$(($cont+1))
done

case $mult in
	1)
	echo ERES NEUTRO CONTRA EL
	;;
	2)
	echo ERES SUPER EFICAZ CONTRA EL
	;;
	0)
	echo NO LE AFECTAS
	;;
	1/2)
	echo ERES POCO EFICAZ CONTRA EL
	;;
esac
case $multe in
	1)
	echo ES NEUTRO CONTRA TI
	;;
	2)
	echo ES SUPER EFICAZ CONTRA TI
	;;
	0)
	echo NO TE AFECTA
	;;
	1/2)
	echo ES POCO EFICAZ CONTRA TI
	;;
esac

tput civis
echo "Pulsa cualquier tecla para continuar"
read -s -n 1 z
tput cnorm

fvida

while true;do
	while true;do
		read -n 1 -p "Modo deseado (h para la ayuda): " mod
		echo ""
		if [ -z $mod ] || { [ $mod != "h" ] && [ $mod != "a" ] && [ $mod != "c" ] && [ $mod != "d" ] && [ $mod != "x" ]; };then
			fcolores 31 OPCION NO VALIDA
			echo ""
		else
			break
		fi
	done

	case $mod in
		h)
		clear
		fcolores 33 "======================"
		fcolores 33 "   Menu De Ayuda"
		fcolores 33 "======================"
		echo "a: ATACAR"
		echo "c: CURAR"
		echo "d: DEFENDER"
		echo "x: HUIR"
		fcolores 33 "======================"
		echo ""
		fcolores 32 Presione cualquier tecla para continuar
		read -s -n 1 salir
		clear

		fvida
		;;
		a)
		clear
		echo "¡Tu pokemon ha atacado!"
		na5=$(shuf -i 1-10 -n 1)
		mode=$(shuf -i 1-3 -n 1)
		if [ $na5 -eq 2 ];then
			crit1=15
			echo "¡CRITICO!"
		else
			crit1=0
		fi

		if [ $1 -le $na3 ];then
			d1=$(((20+$crit1)*$mult))
		elif [ $1 -le $na4 ];then
			d1=$(((50+$crit1)*$mult))
		else
			d1=$(((75+$crit1)*$mult))
		fi
		echo "Has hecho $d1 de daño"

		case $mode in
			1)
			echo "¡El pokemon salvaje te ataca tambien!"
			na5=$(shuf -i 1-10 -n 1)
			if [ $na5 -eq 2 ];then
				crit2=15
				echo "¡CRITICO!"
			else
				crit2=0
			fi

			if [ $2 -le $na3 ];then
				d2=$(((20+$crit2)*$multe))
			elif [ $2 -le $na4 ];then
				d2=$(((50+$crit2)*$multe))
			else
				d2=$(((75+$crit2)*$multe))
			fi

			echo "Te ha hecho $d2 de daño"

			hpe2=$(($hpe2-$d1))
			hp2=$(($hp2-$d2))
			if [ $hpe2 -lt 0 ];then
				hpe2=0
			fi

			if [ $hp2 -lt 0 ];then
				hp2=0
			fi
			;;
			2)
			cur2=$(shuf -e 25 50 75 -n 1)
			hpe2=$(($hpe2-$d1))
			if [ $hpe2 -lt 0 ];then
				hpe2=0
				echo "Lo has derrotado"
			elif [ $hpe2 -lt $hpe1 ];then
				hpe2=$(($hpe2+$cur2))
			fi
			if [ $hpe2 -gt $hpe1 ];then
				hpe2=$hpe1
				echo "El rival se ha curado por completo"
			else
				echo "El rival se ha curado $cur2"
			fi
			;;
			3)
			echo "El rival se esta defendiendo. No le haces daño"
			;;
		esac
		fvida
		;;
		c)
		clear
		cur1=$(shuf -e 25 50 75 -n 1)
		mode=$(shuf -i 1-2 -n 1)

		case $mode in
			1)
			if [ $hp2 -lt $hp1 ];then
				hp2=$(($hp2+$cur1))
			fi
			if [ $hp2 -gt $hp1 ];then
				hp2=$hp1
				echo "Te has curado por completo"
			else
				echo "Te has curado $cur2"
			fi

			na5=$(shuf -i 1-10 -n 1)
			echo "El rival te ataca"
			if [ $na5 -eq 2 ];then
				crit2=15
				echo "¡CRITICO!"
			else
				crit2=0
			fi

			if [ $2 -le $na3 ];then
				d2=$(((20+$crit2)*$multe))
			elif [ $2 -le $na4 ];then
				d2=$(((50+$crit2)*$multe))
			else
				d2=$(((75+$crit2)*$multe))
			fi
			if [ $hp2 -le 0 ];then
				echo "Te han derrotado"
				hp2=0
			else
				echo "Te ha hecho $d2 de daño"
			fi
			;;
			2)
			cur2=$(shuf -e 25 50 75 -n 1)
			hp2=$(($hp2+$cur1))
			hpe2=$(($hpe2+$cur2))
			if [ $hp2 -gt $hp1 ];then
				hp2=$hp1
				echo "Te has curado por completo"
			else
				echo "Te has curado $cur2"
			fi
			if [ $hpe2 -gt $hpe1 ];then
				hpe2=$hpe1
				echo "Tu rival se ha curado por completo"
			else
				echo "Tu rival se ha curado $cur2"
			fi
			;;
		esac
		fvida
		;;
		d)
		clear
		mode=$(shuf -i 1-2 -n 1)
		echo "Tu pokemon se esta defendiendo"
		case $mode in
			1)
			echo "El pokemon rival te ataca pero no recibes daño"
			;;
			2)
			cur2=$(shuf -e 25 50 75 -n 1)
			hpe2=$(($hpe2+$cur2))
			if [ $hpe2 -gt $hpe1 ];then
				hpe2=$hpe1
				echo "El rival se ha curado por completo"
			else
				echo "Tu rival se ha curado $cur2"
			fi
			;;
		esac
		fvida
		;;
		x)
		clear
		echo "Has huido.."
		sleep 1
		break
		;;
	esac
	if [ $hpe2 -eq 0 ];then
		resultado=1
		break
	elif [ $hp2 -eq 0 ];then
		resultado=0
		break
	elif [ "$mod" = "x" ];then
		resultado=0
		break
	fi
done

