# VERY DUMB SCRIPT TO INSTALL STUFF. WILL OVERWRITE YOUR nvim/init.vim and $PROFILE!
$ErrorActionPreference = "Stop"

# Install CascadiaCode fonts
$CascadiaCodeUrl = 'https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip'
$CascadiaCodePath = "$env:TEMP/CascadiaCode"
$CascadiaCodeZip = "$CascadiaCodePath.zip"
If ($(Test-Path $CascadiaCodePath))
{
    Write-Host "CascadiaCode already installed! ($CascadiaCodePath)"
}
Else
{
    Invoke-WebRequest $CascadiaCodeUrl -OutFile $CascadiaCodeZip
    Expand-Archive $CascadiaCodeZip $CascadiaCodePath
}

# yoink https://www.jordanmalcolm.com/deploying-windows-10-fonts-at-scale/
$FontFolder = "$CascadiaCodePath/ttf"
$FontItem = Get-Item -Path $FontFolder
$FontList = Get-ChildItem -Path "$FontItem" -Include ('*.ttf')

foreach ($Font in $FontList) {
    Write-Host 'Installing font -' $Font.BaseName
    Copy-Item $Font "C:\Windows\Fonts"
    New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name
}

# Install other programs
winget install JanDeDobbeleer.OhMyPosh
winget install neovim
Install-Module posh-git -scope CurrentUser

# Install config files
cp -r -force ./configs/nvim $env:LOCALAPPDATA
cp -force ./configs/Microsoft.PowerShell_profile.ps1 $PROFILE