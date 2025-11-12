# Vérification de la prescence du module "AudioDeviceCmdlets"
$module = Get-Module AudioDeviceCmdlets -Verbose

if (!($module)) {
    Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser -Verbose
    Import-Module -Name AudioDeviceCmdlets -Verbose
}

#Vérifie si le périphérique USB est connecté
$usbDevice = Get-PnpDevice | Where-Object { $_.FriendlyName -like 'Haut-parleurs (C-Media USB Audio Device   )' } -Verbose

#Activation du casque si detecté
if ($usbDevice.Status -eq 'OK') {
    Write-Host " Casque USB, bascule vers $($usbDevice.FriendlyName)" -ForegroundColor Green
    Write-Output " $(get-date) - Bascule vers le casque OK" >> .\log.txt
    Set-AudioDevice -ID '{0.0.0.00000000}.{e4717860-080c-4853-9200-1e77c0dd46ef}' 
} else {
    Write-Output " $(get-date) - Bascule vers le casque non effectuée, casque non branché" >> .\log.txt
}


#C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

#-File "C:\Users\chris\Documents\switch-audiocard\main.ps1"