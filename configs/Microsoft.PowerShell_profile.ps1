$ConfigRepo = "$env:USERPROFILE/source/repos/config"
$Configs = "$ConfigRepo/configs"

Import-Module posh-git
oh-my-posh init pwsh --config "$Configs/powerline.omp.json" | Invoke-Expression

Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'
Import-Module PSFzf

Set-Alias -Name vim -Value nvim

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
