$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$manifest = Get-Content -LiteralPath (Join-Path $root 'manifesto_download.json') -Raw | ConvertFrom-Json
$full = $manifest.completo
$output = Join-Path $root $full.arquivo
if (Test-Path -LiteralPath $output) {
    if ((Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash.ToLower() -ne $full.sha256) { throw 'Arquivo existente divergente; preservado.' }
    Write-Host 'O ZIP completo ja esta correto.'
    exit 0
}
$temp = "$output.tmp"
$dest = [System.IO.File]::Create($temp)
try {
    foreach ($part in $full.partes) {
        $path = Join-Path (Join-Path $root 'completo_partes') $part.arquivo
        if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLower() -ne $part.sha256) { throw "Parte invalida: $path" }
        $source = [System.IO.File]::OpenRead($path)
        try { $source.CopyTo($dest) } finally { $source.Dispose() }
    }
} finally { $dest.Dispose() }
if ((Get-FileHash -LiteralPath $temp -Algorithm SHA256).Hash.ToLower() -ne $full.sha256) { throw 'Verificacao final falhou.' }
Move-Item -LiteralPath $temp -Destination $output
Write-Host "ZIP completo criado e verificado: $output"
