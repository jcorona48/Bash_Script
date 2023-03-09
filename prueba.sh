
#!/usr/bin/env bash
#!/bin/bash


if (($error == 1)); then
    trap 'echo "Solo se permite 2 argumentos"' ERR
else 
    trap 'echo "Digita un numero gil"' ERR
fi
while (( 1 )) 
do 
    echo -n "Enter any number ( -1 to exit ): " 
    read num

    [ "$num" -eq "$num" ] 

    status=$?

    if (( $# != 2 )) && (($status == 0)); then 
        echo "Mult $num is $(( num * num ))" 
    else 
        error = 1;
        capuchino
    fi 
done

echo "Exiting normally"