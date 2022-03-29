# 1 - BUCLE 10 REPETICIONES" QUE OBTENGA DIEZ NÚMEROS ALEATORIOS, SE GUARDEN EN UN TXT E INFORME DEL NÚMERO MAYOR, LA FECHA Y LA HORA DEL SISTEMA
# 2 - MOSTRAR USUARIOS LOCALES DEL SISTEMA"
# 3 - SECUENCIA" -> DESDE EL NÚMERO 2 MOSTRAR TODOS LOS PARES HASTA EL NÚMERO 50
# 4 - LEER TXT" LEER TXT DE LA OPCION 1 Y MOSTRAR POR PANTALLA EL NÚMERO MENOR
# 5 - PEDIR 10 NOMBRES DE PERSONAS" GUARDARLAS EN UN ARRAY ORDENADO Y GUARDARLA EN UN TXT
# 6 - SALIR

# 1 - BUCLE 10 REPETICIONES" QUE OBTENGA DIEZ NÚMEROS ALEATORIOS, 
# SE GUARDEN EN UN TXT 
# E INFORME DEL NÚMERO MAYOR, LA FECHA Y LA HORA DEL SISTEMA
function bucleRepeticiones {
    param(
        [string]$fichero = "secuencia.txt",
        [int]$cantidad = 10,
        # Aleatorio del 1 al 10 ambos incluidos
        [int]$minimoAleatorio = 1,
        [int]$maximoAleatorio = 10
    )

    [int]$mayor = 0
    $maximoAleatorio++

    Get-Date > $fichero

    "Secuencia de aleatorios:" > $fichero
    for ($i = 1; $i -lt $cantidad + 1; $i++) {
    
        [int]$aleatorio = Get-Random -Minimum $minimoAleatorio -Maximum $maximoAleatorio
        
        if ($aleatorio -gt $mayor) { $mayor = $aleatorio }
        $aleatorio >> $fichero
    }

    "El mayor es: " + 
    $mayor >> $fichero
    Write-Host "Secuencia aleatorio generada" -ForegroundColor Green

}

# 2 - MOSTRAR USUARIOS LOCALES DEL SISTEMA"
function mostarUsuarios {

    # Get-LocalUser | Write-Host
    # Start-Sleep -Seconds 2
    $usuarios = Get-LocalUser
    foreach ($usuario in $usuarios) {
        # If ($usuario.Enabled) { Write-Host $usuario.Name }
        Write-Host $usuario.Name
    }

}

# 3 - SECUENCIA" -> DESDE EL NÚMERO 2 MOSTRAR TODOS LOS PARES HASTA EL NÚMERO 50
function secuenciaDePares {
    param (
        [int]$inicio = 2,
        [int]$salto = 2,
        [int]$fin = 50
    )
    
    for ($i = $inicio; $i -le $fin; $i += $salto) {
        Write-Host $i
    }

}

# 4 - LEER TXT" LEER TXT DE LA OPCION 1 Y MOSTRAR POR PANTALLA EL NÚMERO MENOR
function leerTxt {
    param(
        [string]$fichero = ".\secuencia.txt"
    )
        
    [int]$menor = [int]::MaxValue
    $numeros = Get-Content -Path $fichero
    
    foreach ($numero in $numeros) {
        try {
            [int]$entero = $numero
        }
        catch {
            [int]$entero = [int]::MaxValue
        }
        if ($entero -lt $menor) { $menor = $entero }
    }

    Write-Host "El menor es $menor"
    
}

# 5 - PEDIR 10 NOMBRES DE PERSONAS" GUARDARLAS EN UN ARRAY ORDENADO Y GUARDARLA EN UN TXT
function pedirNombres {
    param(
        [int]$peticiones = 4,
        [string]$fichero = "nombres.txt"
    )
    [string[]]$nombres = @()  
    if (Test-Path $fichero) { Remove-Item $fichero }

    do {
        [string]$nombre = Read-Host "Introduce el nombre" ($nombres.Count + 1)
        
        if ($nombres.Contains($nombre)) {
            Write-Host "'$nombre' ya se encuentar en la BBDD." -ForegroundColor Red
        } 
        else {
            $nombres += $nombre
            $nombres = $nombres | Sort-Object
            Write-host $nombres
            Write-Host "'$nombre' ha sido a?adido a la BBDD correctamente." -ForegroundColor Green
            Write-host "A?adidos: " $nombres.Count "/" $peticiones
        }
        
    } until ($nombres.Count -eq $peticiones)

    foreach ($nombre in $nombres) {
        $nombre >> $fichero
    }

}


# 6 - SALIR
function despedida {
    
    Clear-Host
    Write-Host ""
    Write-Host "Gracias por su visita, hasta la próxima." 
    Write-Host ""
    
}

#  FUNCIÓN MENU
function menu {
    
    do {
        Clear-Host
        Write-Host ""
        Write-Host "     ========== Menú 01 ========="
        Write-Host "     | 1. - Bucle Aleatorios    |"
        Write-Host "     | 2. - Usuarios Locales    |"
        Write-Host "     | 3. - Secuencia de Pares  |"
        Write-Host "     | 4. - Leer fichero .txt   |"
        Write-Host "     | 5. - Pedir 10 nombres    |"
        Write-Host "     | -------------------------|"
        Write-Host "     | S. - Salir               |"
        Write-Host "     ============================"
        Write-Host ""
        
        
        $opcion = ""
        [string]$opcion = Read-Host "Selecciona una opción"

        switch ($opcion) {
            1 { bucleRepeticiones }
            2 { mostarUsuarios }
            3 { secuenciaDePares }
            4 { leerTxt }
            5 { pedirNombres(10) }
            "S" { despedida }
        }
        
        Pause

    } until ($opcion -eq "S")

}

menu   # INICIO EL MENÚ