Import-Module PSReadLine
Import-Module Sudo
Import-Module ZLocation

Invoke-Expression (&starship init powershell)

# Inlcude all scripts in the config profile.d folder
$scriptFolder = Join-Path $HOME '.config/powershell/profile.d'
$scripts = Get-ChildItem -Path $scriptFolder -Filter '*.ps1'
foreach ($script in $scripts) {
  . $script.FullName
}
