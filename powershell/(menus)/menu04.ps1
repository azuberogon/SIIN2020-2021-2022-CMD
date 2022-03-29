#1. Lee un fichero ips.txt (tendras varias ips, una por línea), 
#haz un Test-Connection y muestra un mensaje (Conexión establecida/ Conexión fallida).
function leerIPs {
    $lineas = Get-Content ".\ips.txt"
    foreach ($linea in $lineas) {
        
        if (Test-Connection $linea -Count 1 -Quiet ) {
            Write-Host "Conexión establecida a la ip $linea" -ForegroundColor Green
        }
        else {
            Write-Host "Conexión fallida a la ip $linea" -ForegroundColor Red
        }
    }
    
}


#2. Lee un fichero users.csv y muestra solo los datos de las columnas Id, Username y Location.

function leerCsv {
    $users = Import-Csv ".\users.csv" -Delimiter ";"
    foreach ($user in $users) {
        Write-Host $user.Id " - " $user.Username " - "$user.Location
    }
}

#3. Pide la ruta de un directorio y lista el contenido de dicho directorio usando un cmdlet.
function listarDirectorio {
    [String] $ruta = Read-Host "introducir algo"
    Get-ChildItem -Path $ruta 
}


#4. Pide la ruta de un directorio y muestra su estructura sin ficheros (la función será la misma en el punto 4 y 5).
function directorioSinficheros([bool]$verFiecheros = $true) {
    [String] $ruta = Read-Host "introducir algo"
    if ($verFiecheros) {
        tree /f $ruta 
    }
    else {
        tree $ruta
    }
}


#5. Pide la ruta de un directorio y muestra su estructura con ficheros (la función será la misma en el punto 4 y 5).



#6. Lista los usuarios locales que estén activados (la función será la misma en el punto 6 y 7).

function usuariosActivos([bool]$verActivos = $true) {
    $usuarios = Get-LocalUser 
    foreach ($usuario in $usuarios) {
        if ($usuario.Enabled -eq $verActivos) {
            Write-Host $usuario.Name
        }
    }
    
}

#7. Lista los usuarios locales que estén desactivados (la función será la misma en el punto 6 y 7).

function usuariosDesActivos {
    Write-Host Get-ADUser
    
}

#8. Lista los grupos locales y mandalos solo su nombre a un fichero grupos.txt en orden descendente. 
function gruposLocales {
    
}


#S. Salir








function menu {
    
    do {
        clear-host
        Clear-Host
        Write-Host ""
        Write-Host "     ================ Menu 03 ==================="
        Write-Host "     | 1. - leer ips                            |"
        Write-Host "     | 2. - fichero users.csv                   |"
        Write-Host "     | 3. - mostar su ayuda                     |"
        Write-Host "     | 4. - mostrar verbos empiecen por texto   |"
        Write-Host "     | 5. - mostrar cmdlet empiecen por texto   |"
        Write-Host "     | 6. - mostrar verbos empiecen por texto   |"
        Write-Host "     | 7. - mostrar cmdlet empiecen por texto   |"
        Write-Host "     | 8. - mostrar verbos empiecen por texto   |"
        Write-Host "     | -----------------------------------------|"
        Write-Host "     | S. - Salir                               |"
        Write-Host "     ============================================"
        Write-Host ""
        
        
        [string]$opcion = Read-Host "Selecciona una opción"

        switch ($opcion) {
            1 { leerIPs }
            2 { leerCsv }
            3 { listarDirectorio }
            4 { directorioSinficheros($false) }
            5 { directorioSinficheros($true) }
            6 { usuariosActivos($true) }
            7 { usuariosActivos($false) }
            8 { mostrarCmdletEmparPor }
            "S" { despedida }
            Default {}
        }
        
        Pause

    } until ($opcion -eq "S")

}
menu


function despedida {
    Clear-Host
    Write-Host "gracias por su visita" -ForegroundColor Blue
    
}



#S. Salir

