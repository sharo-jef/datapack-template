Param(
    [parameter(Mandatory=$true)][string]$Namespace,
    [parameter(Mandatory=$true)][string]$Description
)

if (!$Namespace) {
    Write-Error 'Invalid namespace.'
    exit 1
}

Write-Output ((Get-Content -Raw .\pack.mcmeta) -replace 'Description here', $Description) | Out-File -NoNewline .\pack.mcmeta
Move-Item -Path .\data\namespace -Destination .\data\$Namespace
Write-Output ((Get-Content -Raw .\data\minecraft\tags\functions\load.json) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\minecraft\tags\functions\load.json
Write-Output ((Get-Content -Raw .\data\minecraft\tags\functions\tick.json) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\minecraft\tags\functions\tick.json
