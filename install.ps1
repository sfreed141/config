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

# yoink https://gist.github.com/anthonyeden/0088b07de8951403a643a8485af2709b
$Fonts = Get-ChildItem -Path "$CascadiaCodePath/ttf/*" -Include '*.ttf'
$Destination = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($Font in $Fonts) {
    Write-Host 'Installing font ' $Font.BaseName
    $Destination.CopyHere($Font.FullName, 0x10)
}

# Install other programs
winget install JanDeDobbeleer.OhMyPosh
winget install neovim
Install-Module posh-git -scope CurrentUser

# Install config files
cp -r -force ./configs/nvim $env:LOCALAPPDATA
cp -force ./configs/Microsoft.PowerShell_profile.ps1 $PROFILE