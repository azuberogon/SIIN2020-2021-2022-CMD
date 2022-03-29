


# BUCLE 10 REPETICIONES" QUE OBTENGA DIEZ NÚMEROS ALEATORIOS, SE GUARDEN EN UN TXT E INFORME DEL NÚMERO MAYOR, LA FECHA Y LA HORA DEL SISTEMA

function buscarAlumno {
    [int]$aleatorio = Get-Random -Minimum 1 -Maximum 100
    for ($i = 0; $i -lt 10; $i++) {
        [int]$aleatorio = Get-Random -Minimum 1 -Maximum 10

        if ($alumnos[$i] -lt $mayor) {
            [int]$mayor = $aleatorio
            Write-Host "El numero mayor es: $mayor"
        }
    }   
    Write-Host "El alumno no esta: "
    pause
    Clear-Host
}

# MOSTRAR USUARIOS LOCALES DEL SISTEMA"
function mostrarUsuarios {
    Get-LocalUser
}


# SECUENCIA" -> DESDE EL NÚMERO 2 MOSTRAR TODOS LOS PARES HASTA EL NÚMERO 50
function secuencia {
    [int]$num = 2
    for ($i = 2; $i -le 50; $i++) {
        if ($i % $num -eq 0) {
            Write-Host $i
        }
    }
    Pause
    Clear-Host    
}


# LEER TXT" LEER TXT DE LA OPCION 1 Y MOSTRAR POR PANTALLA EL NÚMERO MENOR
function FunctionName {

    if ($alumnos[$i] -lt $mayor) {
        [int]$mayor = $aleatorio
        Write-Host "El numero mayor es: $mayor"
    }
       
}


# PEDIR 10 NOMBRES DE PERSONAS" GUARDARLAS EN UN ARRAY ORDENADO Y GUARDARLA EN UN TXT



# SALIR
