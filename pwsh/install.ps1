#!/usr/bin/env pwsh

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

if ($IsLinux) {
  Write-Host 'Linux powershell setup'
}

if ($IsMacOS) {
  Write-Host 'MacOS powershell setup'
}

if ($IsWindows) {
  Write-Host 'Windows powershell setup'
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
}

Install-Module -Name PSReadline -Scope CurrentUser -Force
Install-Module -Name Sudo -Scope CurrentUser -Force
Install-Module -Name ZLocation -Scope CurrentUser -Force
