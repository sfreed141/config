# config
My usual new machine setup steps, configs, and useful software.

To get most of the way there just run `install.ps1`. May need to run `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser`.

## Windows
1. Install
    - git ([downloads](https://git-scm.com/download/win) or `winget install -e --id Git.Git -s winget`)
    - Cascadia Mono PL ([info](https://learn.microsoft.com/en-us/windows/terminal/cascadia-code), [releases](https://github.com/microsoft/cascadia-code/releases)).
    - Visual Studio Code ([downloads](https://code.visualstudio.com/Download) or `winget install  -e --id Microsoft.VisualStudioCode -s winget`)
    - Neovim ([downloads](https://neovim.io/) or `winget install -e --id Neovim.Neovim -s winget`)
    - OhMyPosh: `winget install JanDeDobbeleer.OhMyPosh -s winget`
    - posh-git: `Install-Module posh-git`

1. Configure Windows Terminal (to access Settings: `ctrl + ,` or use dropdown menu next to tabs)
    - Under Startup, set Default profile to PowerShell and set Default terminal application to Windows Terminal
    - Under Defaults | Appearance, set Font face to Cascadia Mono PL

1. Configure Visual Studio Code (to access Settings: `ctrl + ,`)
    - Set Render Whitespace to boundary
    - Set Trim Trailing Whitespace to true
    - Set Terminal | Integrated | Font Family to Cascadia Mono PL

1. Configure Powershell
    - Replace your current profile with the one from this repo: `cp configs/Microsoft.PowerShell_profile.ps1 $PROFILE`
    - Edit it as needed (eg `code $PROFILE` or `nvim $PROFILE`)

1. Configure Neovim
    - `cp -r configs/nvim $env:LOCALAPPDATA`

### Other software
- Visual Studio (`Microsoft.VisualStudio.2022.Community`)
- ProcessExplorer (`Microsoft.Sysinternals.ProcessExplorer`)
- ProcessMonitor (`Microsoft.Sysinternals.ProcessMonitor`)
- DebugView
- TcpView
- Wireshark (`WiresharkFoundation.Wireshark`)
- PerfView (`Microsoft.PerfView`)
- PIX on Windows
- RenderDoc (`BaldurKarlsson.RenderDoc`)

### VSCode extensions
#### General
- GitLens
- Remote Development
- Hex Editor
#### Language
- C/C++ Extension Pack
- PowerShell
- Python
- Pylance
- XML

### VS setup
- VSCode key bindings
#### Extensions
- Child Process Debugging