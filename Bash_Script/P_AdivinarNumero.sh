
#!/usr/bin/env bash

while [ true ]
do
    echo "Ingrese un numero: "
    read num

    if [[ "$num" == 5 ]]; then
    break
    fi
    echo "Numero erroneo, prueba con otro... "
done

echo "Encontraste el numero 5. "