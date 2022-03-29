#1. Pedir un alias y mostrar su cmdlet
function mostrarCmdlet {
    [string]$Alias = Read-Host "Introduce el Alias"
    Get-Alias $Alias
    
}

#2. Pedir un cmdlet y motrar todos sus alias
function mostrarAlias {
    [string]$Cmdlt = Read-Host "Introduce el cmdlt para recibir su alias..."
    Get-Alias -Definition $Cmdlt
    
}

#3. Pedir un cmdlet y mostar su ayuda
function mostrarAyudas {
    [string]$help = Read-Host "Introduce cmdlet con para recibir su ayuda... "
    Get-Help $help* 
    
}

#4. Pedir un texto y mostrar todos los verbos que empiecen por el texto
function mostrarVerbos {  
    [String]$verbos = Read-Host "mostrar todos los verbos que empiecen por..." 
    Get-Verb $verbos*
}

#5. Pedir un texto y mostrar todos los cmdlet que empiecen por el texto
function mostrarCmdletEmparPor {
    [string]$texto = Read-Host "Ver los comandos que empiecen por..."
    Get-Command $texto*
}

#menu
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
        Write-Host "     ================ Menu 03 ==================="
        Write-Host "     | 1. - Alias-mostrar su cmdlet             |"
        Write-Host "     | 2. - cmdlet-motrar todos sus alias       |"
        Write-Host "     | 3. - mostar su ayuda                     |"
        Write-Host "     | 4. - mostrar verbos empiecen por texto   |"
        Write-Host "     | 5. - mostrar cmdlet empiecen por texto   |"
        Write-Host "     | -----------------------------------------|"
        Write-Host "     | S. - Salir                               |"
        Write-Host "     ============================================"
        Write-Host ""
        
        
        $opcion = ""
        [string]$opcion = Read-Host "Selecciona una opción"

        switch ($opcion) {
            1 { mostrarCmdlet }
            2 { mostrarAlias }
            3 { mostrarAyudas }
            4 { mostrarVerbos }
            5 { mostrarCmdletEmparPor }
            "S" { despedida }
        }
        
        Pause

    } until ($opcion -eq "S")

}
#S. Salir

menu

