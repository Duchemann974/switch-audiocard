
$module = Get-Module AudioDeviceCmdlets -Verbose

if (!($module)) {
    Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser -Verbose
    Import-Module -Name AudioDeviceCmdlets -Verbose
}


# Vérifie si le périphérique USB est connecté
$usbDevice = Get-PnpDevice | Where-Object { $_.FriendlyName -like 'Haut-parleurs (C-Media USB Audio Device   )' } -Verbose

if ($usbDevice) {
    Write-Host "🎧 Casque USB détecté — bascule vers $($usbDevice.FriendlyName)" -ForegroundColor Green
    Set-AudioDevice -ID "{0.0.0.00000000}.{e4717860-080c-4853-9200-1e77c0dd46ef}" 
} 