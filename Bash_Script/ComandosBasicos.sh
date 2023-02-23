
#!/usr/bin/env bash

# Echo se utiliza para imprimir en consola o pantalla:
echo "Hello world!" # => No es necesario colocar punto y coma ";" al final de cada linea.

# Se declaran las variables sin especificar tipo de dato:
variable="Some string"

# Es importante no agregar el espacio antes ni despues del signo de igual
# Si lo haces, no entendera la instruccion.

# Para el uso de variables es importante colocarlo entre doble comilla
# Tambien agregar el simbolo de moneda "$" antes de la variable.
echo "$variable" # => Some string
echo '$variable' # => $variable

# Para obtener la cantidad de caracteres se utiliza:
echo "${#variable}" # => 11

# Los array se declaran colocando entre parentesis los valores, si colocar entre comillas
array=(one two three four five six)
# Los array comienzan con indice en 0 y @ imprime todos los valores:
echo "${array[0]}" # => "one"
# Print all elements:
echo "${array[@]}" # => "one two three four five six"


# Este es un ciclo for que le va asignando cada valor dentro del array a item y lo va mostrando:
for item in "${array[@]}"; do
    echo "$item"
done

# Built-in variables:
# There are some useful built-in variables, like:
echo "Last program's return value: $?"
echo "Script's PID: $$"
echo "Number of arguments passed to script: $#"
echo "All arguments passed to script: $@"
echo "Script's arguments separated into different variables: $1 $2..."

# puedes utilziar esta forma de imprimir un rango de valores:
echo {1..10} # => 1 2 3 4 5 6 7 8 9 10
echo {a..z} # => a b c d e f g h i j k l m n o p q r s t u v w x y z


echo "I'm in $(pwd)" # Esta ejecuta pwd y el resultado lo concatena con el string
echo "I'm in $PWD" # este solo ingresa la variable pwd


clear # Ctrl-L o Este comando para limpiar pantalla

# Para leer valores primero imprimes el requisito y luego el comando read siguiente
# De la variable que guardara el valor
echo "What's your name?"
read name
# Note that we didn't need to declare a new variable.
echo "Hello, $name!"

# Las condicionales se usan entre corchetes.
# al final de una condicion se coloca fi, al inicio del comando a ejecutar si se cumple se coloca then:
if [[ "$name" != "$USER" ]]; then
    echo "Your name isn't your username"
else
    echo "Your name is your username"
fi

# Se utilizan los operadores and y or con && y ||:
read age
if [[ "$name" == "Steve" ]] && [[ "$age" -eq 15 ]]; then
    echo "This will run if $name is Steve AND $age is 15."
fi

if [[ "$name" == "Daniya" ]] || [[ "$name" == "Zach" ]]; then
    echo "This will run if $name is Daniya OR Zach."
fi
# No es necesario colocar los comparadores con los signos, se puede con estos equivalentes:
# -ne - not equal
# -lt - less than
# -gt - greater than
# -le - less than or equal to
# -ge - greater than or equal to

# El operador `=~` se utiliza para comparar con una serie de parametos:
# Primero pide que empiece con texto maximo 20 antes del arroba
# Despues pide texto con una longitud minima de 2, para temrinar con "Com", "net" o "org"
email=me@example.com
if [[ "$email" =~ [a-z]{,20}+@[a-z]{2,}\.(com|net|org) ]]
then
    echo "Valid email!"
fi

# Este es equivalente a switch en otros lenguajes:
case "$Variable" in
    # Evalua el valor en cada caso.
    0) echo "There is a zero.";;
    1) echo "There is a one.";;
    *) echo "It is not null.";;  # match everything
esac
# Para cerrarlo es importante escribir el comando inverso.

# Este es un ciclo for que se repetira 3 veces comenzando desde el 1 hasta el 3.
for Variable in {1..3}
do
    echo "$Variable"
done
# => 1
# => 2
# => 3

# Tambien se puede utilizar de forma convencional con Inicialozador: Parada: accion:
for ((a=1; a <= 3; a++))
do
    echo $a
done
# => 1
# => 2
# => 3

# Asi mismo se puede utilizar para archivos
for Variable in file1 file2
do
    cat "$Variable"
done

# Tambien para obtener datos de los comandos individualmente.
# Tras probar, cat imprime lo que tiene el archivo dentro.
for Output in $(ls)
do
    cat "$Output"
done



# Tambien esta el ciclo while:
while [ true ]
do
    echo "loop body here..."
    break
done
# => loop body here...

# Para declarar funciones en bash
function foo ()
{
    echo "Arguments work just like script arguments: $@"
    echo "And: $1 $2..."
    echo "This is a function"
    returnValue=0    # Variable values can be returned
    return $returnValue
}
# Para añadir argumentos solo se le agrega un espacio
foo arg1 arg2

# Para capturar el valor de retorno se utiliza $?
resultValue=$?

# Tambien se pueden declarar sin la palabra function antes
bar ()
{
    echo "Another way to declare functions!"
    return 0
}
