##
##  LAB: Transformación de archivos con `sed`
##  ================================================
##
##  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
##  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
##  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
##  la aplicación de procedimientos manuales no es práctica.
##  
##  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
##  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
##  para los campos son los siguientes:
##  
##  * Columna 1: `DD/MM/AA`.
##  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
##  * Columna 3: Número entero. `\N` indica NULL.
##  * Columna 4: Número decimal. `\N` indica NULL.
##  
##  
##  Usted debe escribir un script en bash que use sed para que realice 
##  las siguientes acciones:
##    
##  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
##  
##  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
##  
##  * Reemplace los `;` por `,`.
##  
##  * Use el `.` para indicar decimales.
##  
##  Rta/
##  2013-03-12,A,1,100.0
##  ...
##  2014-09-01,A,3,100.4
##
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash
# Pone el 20
sed 's/\/\([0-9][0-9]\);/\/20\1;/' data.csv > data_out.txt ##
## Cambia posiciones
sed -i 's/\([0-9]*\)\/\([0-9]*\)\/\([0-9]*\)/\3-\2-\1/' data_out.txt ##
## Completa los numeros sin cero
sed -i 's/-\([0-9]\)-\([0-9]\);/-0\1-0\2;/' data_out.txt ##
## Agregar nulos \N
sed -i 's/;;/;\\N;/' data_out.txt ##
sed -i 's/;N;/;\\N;/' data_out.txt ##
sed -i 's/;n/;\\N/' data_out.txt ##
sed -i 's/;\\n;/;\\N;/' data_out.txt ##
## Cambiar punto y coma por comas
sed -i 's/,/./g' data_out.txt ##
sed -i 's/;/,/g' data_out.txt ##
sed -i 's/,$/,\\N/g' data_out.txt ##
## Cambia de minúsculas a mayúsculas
sed -i 's/a/A/'  data_out.txt ##
sed -i 's/b/B/'  data_out.txt ##
sed -i 's/c/C/'  data_out.txt ##
## Pone \N al final 5ta linea
sed -i '5 s/\N,/\N,\\N/2'  data_out.txt ##
## Pone \N al final 7ma linea
sed -i '7 s/\N,/\N,\\N/1' data_out.txt ##
cat data_out.txt ##