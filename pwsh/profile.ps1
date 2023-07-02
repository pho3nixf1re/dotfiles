Import-Module PSReadLine
Import-Module Sudo
Import-Module ZLocation

Invoke-Expression (&starship init powershell)

$LocalProfile = Join-Path $PSScriptRoot 'profile.local.ps1'
if (Test-Path $LocalProfile) {
  . $LocalProfile
}
