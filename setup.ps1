Param(
    [parameter(Mandatory = $true)][string]$Namespace,
    [string]$Description = ''
)

if (!$Namespace) {
    Write-Error 'Invalid namespace.'
    exit 1
}

Write-Output ((Get-Content -Raw .\pack.mcmeta) -replace 'Description here', $Description) | Out-File -NoNewline .\pack.mcmeta
Write-Output ((Get-Content -Raw .\data\minecraft\tags\function\load.json) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\minecraft\tags\function\load.json
Write-Output ((Get-Content -Raw .\data\minecraft\tags\function\tick.json) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\minecraft\tags\function\tick.json
Write-Output ((Get-Content -Raw .\data\namespace\function\load\.mcfunction) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\namespace\function\load\.mcfunction
Write-Output ((Get-Content -Raw .\data\namespace\function\tick\.mcfunction) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\namespace\function\tick\.mcfunction
Write-Output ((Get-Content -Raw .\data\namespace\function\uninstall\.mcfunction) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\namespace\function\uninstall\.mcfunction
Move-Item -Path .\data\namespace -Destination .\data\$Namespace
