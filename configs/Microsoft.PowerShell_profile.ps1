$ConfigRepo = "$env:USERPROFILE/source/repos/config"
$Configs = "$ConfigRepo/configs"

Import-Module posh-git
oh-my-posh init pwsh --config "$Configs/powerline.omp.json" | Invoke-Expression

Set-Alias -Name vim -Value nvim

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
