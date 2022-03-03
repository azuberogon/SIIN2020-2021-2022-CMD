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