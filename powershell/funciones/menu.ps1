
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

#1: Con un bucle FOR pedir al usuario el número máximo que tiene que aparecer en pantalla. Mostrar desde el 0 hasta el número máximo.
function NumeroMaximo {
    [Int]$num = Read-Host "Introduce un numero"

    for ($i = 0; $i -le $num; $i++) {
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
            [string]$genero = Read-Host "Introduce h(hombre), m(mujer) s=salir"
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
    [string]$letra = (Read-Host "introduce una letra").tolower()
    [string]$frase = (Read-Host "introduce una frase ").tolower()
    [int]$contador = 0

    for ($i = 0; $i -lt $frase.Length ; $i++) {

        if ($frase[$i] -eq $letra) {
            $contador++
        }

    }

    Write-Host "Frase: $frase"
    Write-Host "letra: $letra"
    Write-Host "Contador: $contador"
    
}


function menu {
    do {
        clear-host
        Write-Host ''
        Write-Host '1. NumeroMaximo'
        Write-Host '2. ListaPueblo'
        Write-Host '3. contadorLetras'
        Write-Host '4. letraFrase'
        Write-Host 'S. salir'
        Write-Host ''
        $selector = Read-Host "Elige una opcion"
        
        Switch ( $selector ) {  
            1 { NumeroMaximo }
            2 { ListaPueblo }
            3 { contadorLetras }
            4 { letraFrase }
            's' { Write-Host 'adios' }
        }    
        Pause
    }until ($selector -eq 's')
    
    
}
menu