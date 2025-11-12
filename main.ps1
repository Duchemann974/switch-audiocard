Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser

# Vérifie si le périphérique USB est connecté
$usbDevice = Get-PnpDevice | Where-Object { $_.FriendlyName -like 'Haut-parleurs (C-Media USB Audio Device   )' }

if ($usbDevice) {
    Write-Host "🎧 Casque USB détecté — bascule vers $($usbDevice.FriendlyName)"
    Set-AudioDevice -ID "{0.0.0.00000000}.{e4717860-080c-4853-9200-1e77c0dd46ef}"
} 