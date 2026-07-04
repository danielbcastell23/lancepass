#!/bin/bash
    c_rojo="\e[0;31m"
    c_verde="\e[0;32m"
    c_amarillo="\e[0;33m"
    c_azul="\e[0;34m"
    c_morado="\e[0;35m"
    c_cian="\e[0;36m"
    c_blanco="\e[0;37m"
    b_rojo="\e[1;31m"
    b_verde="\e[1;32m"
    b_amarillo="\e[1;33m"
    b_azul="\e[1;34m"
    b_morado="\e[1;35m"
    b_cian="\e[1;36m"
    b_blanco="\e[1;37m"
    finColor="\e[0m"

    echo -e "${b_cian}"
    echo -e "  _                            ____               "
    echo -e " | |    __ _ _ __   ___ ___   |  _ \\ __ _ ___ ___ "
    echo -e " | |   / _\` | '_ \\ / __/ _ \\  | |_) / _\` / __/ __|"
    echo -e " | |__| (_| | | | | (_|  __/  |  __/ (_| \\__ \\__ \\"
    echo -e " |_____\\__,_|_| |_|\\___\\___|  |_|   \\__,_|___/___/"
    echo -e "${finColor}"
    echo -e "\t${b_morado}[*] Advanced Password Generator${finColor}"
    echo -e "\t${b_rojo}[!] Still updating...${finColor}\n"

sleep 0.5

mayusPassword="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
basePassword="abcdefghijklmnopqrstuvwxyz"
specialPassword="!@#$%^&*"

function password {
    All=$basePassword
    length=$1
if [ -n "$length" ] && ! [[ "$length" =~ ^[0-9]+$ ]]; then
    echo -e "\n${b_rojo}[!] Critical error: The value of '-u' must be an integer.${finColor}\n"
    exit 1

fi
    if [ -n "$length" ]; then
        echo -e "\t${b_azul}[/]${finColor}${b_blanco} Your Password will have${finColor} ${b_azul}$length${finColor}${b_blanco} characters! ${finColor}"
    else
        length=10
        echo -e "\n${b_azul}[/]${finColor}${b_blanco} Your Password will have${finColor}${b_azul} 10${finColor}${b_blanco} characters${finColor}"
    fi

    if [ "$use_special" == true ]; then
        All="${All}${specialPassword}"
    fi

    if [ "$use_uppernum" == true ]; then
        All="${All}${mayusPassword}"
    fi

    finalPass=$(echo "$All" | fold -w1 | shuf -r | head -n $length | tr -d "\n")

if [ "$use_special" == "true" ] || [ "$use_uppernum" == "true" ]; then
	echo -e "\n${b_azul}[+]${finColor} ${b_blanco}Your password 'including' Special Characters / Numbers or Capital letters is:${finColor} ${b_azul}$finalPass${finColor}"
else
	echo -e "\n${b_azul}[+]${finColor}${b_blanco} Your password 'without' any special characters / Capital letters or Numbers is:${finColor} ${b_azul}$finalPass${finColor}"
fi

}

function helpPanel {
    echo -e "\n Usage of $0:"
    echo -e "\t-u <number> : Specifies the password length (e.g., -u 15)"
    echo -e "\t-s          : Includes special characters"
    echo -e "\t-m          : Includes uppercase letters and numbers"
    echo -e "\t-h          : Shows this help panel\n"
}

declare -i parameter_counter=0
use_special=false
use_uppernum=false
password_length=""

while getopts "u:smh" opt; do
    case $opt in
        u) password_length=$OPTARG; let parameter_counter+=1 ;;
        s) use_special=true; let parameter_counter+=1 ;;
        m) use_uppernum=true; let parameter_counter+=1 ;;
        h) helpPanel; exit 0 ;;
        *) helpPanel; exit 1 ;;
    esac
done

if [ $parameter_counter -eq 0 ]; then
    helpPanel
else
    password "$password_length"
fi
