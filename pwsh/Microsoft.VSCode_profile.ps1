# VSCode does not load the profile by default, so we need to load it manually.
$ProfilePath = Join-Path $PSScriptRoot 'profile.ps1'
. $ProfilePath
