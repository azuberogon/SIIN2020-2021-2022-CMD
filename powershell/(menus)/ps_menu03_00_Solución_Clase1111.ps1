function menu04 {
    
    do {
        Clear-Host
        Write-Host "
        
            1. Lee un fichero ips.txt (tendras varias ips, una por línea), haz un Test-Connection y muestra un mensaje (Conexión establecida/ Conexión fallida).
            2. Lee un fichero users.csv y muestra solo los datos de las columnas Id, Username y Location.
            3. Pide la ruta de un directorio y lista el contenido de dicho directorio usando un cmdlet.
            4. Pide la ruta de un directorio y muestra su estructura sin ficheros (la función será la misma en el punto 4 y 5).
            5. Pide la ruta de un directorio y muestra su estructura con ficheros (la función será la misma en el punto 4 y 5).
            6. Lista los usuarios locales que estén activados (la función será la misma en el punto 6 y 7).
            7. Lista los usuarios locales que estén desactivados (la función será la misma en el punto 6 y 7).
            8. Lista los grupos locales y mandalos solo su nombre a un fichero grupos.txt en orden descendente. 
            S. Salir
        
        "        

        $opcion = Read-Host "Selecciona una opción:"

        switch ($opcion) {
            1 { leerIps }
            2 { leerCsv }
            3 { listarDirectorio }
            4 { muestraEstructura($False) }
            5 { muestraEstructura($True) }
            6 { listarUsuarios($True) }
            7 { listarUsuarios($False) }
            8 { mostrarGrupos }
            S { salir }
            Default { opcionNoValida }
        }
    
        Pause

    } until ($opcion -eq "S")
    
}

function opcionNoValida {
    Clear-Host
    Write-Host "

        Opción no permitida!!!
    
    " -ForegroundColor Red
}

# 1. Lee un fichero ips.txt (tendras varias ips, una por línea), haz un Test-Connection y muestra un mensaje (Conexión establecida/ Conexión fallida).
function leerIps {
    
    $ips = Get-Content ".\ips.txt"
    foreach ($ip in $ips) {
        $hayConexion = Test-Connection $ip -Count 1 -Quiet
        if ($hayConexion) {
            Write-Host "Conexión establecida con la ip $ip" -ForegroundColor Green
        }
        else {
            Write-Host "Conexión fallida con la ip $ip" -ForegroundColor Red
        }
    }

}

# 2. Lee un fichero users.csv y muestra solo los datos de las columnas Id, Username y Location.
function leerCsv {
    $usuarios = Import-Csv -Path ".\users.csv" -Delimiter ";"
    
    foreach ($usuario in $usuarios) {
        Write-Host $usuario.id " - " $usuario.Username " - " $usuario.Location
    }
    
}

# 3. Pide la ruta de un directorio y lista el contenido de dicho directorio usando un cmdlet.
function listarDirectorio {
    $ruta = Read-Host "Introduce una ruta:"
    Get-ChildItem $ruta
}

# 4. Pide la ruta de un directorio y muestra su estructura sin ficheros (la función será la misma en el punto 4 y 5).
# 5. Pide la ruta de un directorio y muestra su estructura con ficheros (la función será la misma en el punto 4 y 5).
function muestraEstructura([bool]$verFicheros = $True) {
    $ruta = Read-Host "Introduce una ruta:"
    if ($verFicheros) {
        Tree /F $ruta
    }
    else {
        Tree $ruta
    }
    
}

function muestraEstructura2([string]$verFicheros = "") {
    $ruta = Read-Host "Introduce una ruta:"
    Tree $verFichros $ruta   
}

# 6. Lista los usuarios locales que estén activados (la función será la misma en el punto 6 y 7).
# 7. Lista los usuarios locales que estén desactivados (la función será la misma en el punto 6 y 7).

function listarUsuarios([bool]$verActivados = $True) {
    $usuarios = Get-LocalUser
    foreach ($usuario in $usuarios) {
        if ($usuario.Enabled -eq $verActivados) {
            Write-Host $usuario.Name
        }
    } 
}

function listarUsuarios2([bool]$verActivados = $True) {
    Get-LocalUser | Where-Object Enabled -eq $verActivados | more
}


# 8. Lista los grupos locales y mandalos solo su nombre a un fichero grupos.txt en orden descendente. 
function mostrarGrupos {
    $file = ".\grupos.txt"
    if (Test-Path $file) { Remove-Item $file }
    $grupos = (Get-LocalGroup).Name | Sort-Object -Descending
    
    foreach ($grupo in $grupos) {
        Write-Host " - " $grupo
        $grupo >> $file
    }
}

# S. Salir
function salir {
    Clear-Host
    Write-Host "
        
        Gracias por su visita, hasta la próxima...
        
    " -ForegroundColor Blue

}

menu04