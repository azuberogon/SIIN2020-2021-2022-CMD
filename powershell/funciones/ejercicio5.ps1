
#crear una funcion llamda menu
# limpiar latermimal
#dibujar unha delas opciones del menu
#pedir una opcion de menu
# Con un Switch mandamos a ejecutar cada opción
# Ten cuenta que necesitamos una opción S=Salir
# De forma que nos pedirá opciones continuamente

#1. Número máximo
# 2. Lista de pueblos
# 3. Hombres y mujeres
# 4. Apariciones de letra en frase
# S. Salir
function menu {
    do {
        clear-host
        [int]$selector 
        Read-Host '1. NumeroMaximo'
        Read-Host '2. ListaPueblo'
        Read-Host '3. contadorLetras'
        Read-Host '4. letraFrase'
        Read-Host 'S. salir'

        Switch ( $selector ) {  
            1 { NumeroMaximo }
            2 { ListaPueblo }
            3 { contadorLetras }
            4 { letraFrase }
            S { exit }
        }    
    }until ($selector -eq 's')

    
}
[int]$selector 
Read-Host "1. NumeroMaximo"
Read-Host "2. ListaPueblo"
Read-Host "3. contadorLetras"
Read-Host "4. letraFrase"


    



#1: Con un bucle FOR pedir al usuario el número máximo que tiene que aparecer en pantalla. Mostrar desde el 0 hasta el número máximo.
function NumeroMaximo {
    [Int]$num = Read-Host "Introduce un numero"

    for ($i = 0; $i -lt $num; $i++) {
        Write-Host $i
    }
}
#2: En un ARRAY meter los siguientes pueblos (TUDELA, ALSASUA, LEKUNBERRI, AOIZ) y con un FOR mostrarlos todos utilizando en la condición del bucle el método COUNT.

function ListaPueblo {
    $pueblos = @("TUDELA", "ALSASUA", "LEKUNBERRI", "AOIZ")
    for ($i = 0; $i -lt $pueblos.Count; $i++) {
        Write-Host $pueblos[$i]
    }
}

function contadorLetras {
    $grupoA = @() #m mujeres n hombres
    $grupoB = @() #n

    #pide variable y la guarda
    [string]$genero = Read-Host "Introduce h(hombre), m(mujer) s=salir"
    [string]$nombre = Read-Host "Introduce tu nombre"

    #(mujer -and 1ºletra < m ) -or (hombre -and 1º letra > n) -le menor que -gt mayor que 
    do {
        do {
            ([string]$genero = Read-Host "Introduce h(hombre), m(mujer) s=salir").ToLower()
            #$genero = $genero.ToUpper()
        }until($genero -eq "H" -or "M" -or "S")
        if ($genero -eq "S") { break }
        do {
            [string]$nombre = Read-Host "Introduce tu nombre"
        }while ($nombre -eq "") 
        if (($genero -eq "M" -and $nombre[0] -lt "m") -or ($genero -eq "H" -and $nombre[0] -gt "n" )) {
            #añadir al grupo A
            $grupoA += $nombre
        }
        else {
            $grupoB += $nombre
        }
    } until ($genero -eq "S")
    #escribe por pantalla lo que introduzcamos
    #esto hace que se 
    Write-Host "grupo A"
    foreach ($nombre in $grupoA) {
        Write-Host "- $nombre"
    }
    Write-Host "grupo B"
    foreach ($nombre in $grupoB) {
        Write-Host "- $nombre"
    }

    
}



function letraFrase {
    [string]$letra = Read-Host "introduce una letra"
    ([string]$frase = Read-Host "introduce una frase ").ToLower()
    [int]$cont = 0
    for ($i = 0; $i -lt $frase.Length ; i++) {
        if ($frase[$i] -eq $letra) {
            cont++
        }
    }
    Write-Host "Frase: $frase"
    Write-Host "letra: $letra"
    Write-Host "contador: $contador"
    
}


