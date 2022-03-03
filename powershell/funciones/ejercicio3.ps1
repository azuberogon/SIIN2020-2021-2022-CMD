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



#function nombre

