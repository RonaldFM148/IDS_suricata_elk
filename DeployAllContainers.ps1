docker network create --driver bridge --subnet=10.0.0.0/16 ids_network

$directories = Get-ChildItem -Directory

foreach ($dir in $directories) {
    # Ruta completa al archivo docker-compose.yml
    $dockerComposeFile = Join-Path $dir.FullName "docker-compose.yml"

    # Verificar si existe el archivo docker-compose.yml en el subdirectorio
    if (Test-Path $dockerComposeFile) {
        Write-Host "Encontrado docker-compose.yml en $($dir.FullName)"
        
        # Cambiar al subdirectorio y ejecutar los comandos de Docker Compose
        Push-Location $dir.FullName
        Write-Host "Ejecutando docker-compose build..."
        docker-compose build

        Write-Host "Ejecutando docker-compose up..."
        docker-compose up -d

        # Volver al directorio anterior
        Pop-Location
    } else {
        Write-Host "No se encontró docker-compose.yml en $($dir.FullName). Omitiendo."
    }
}

