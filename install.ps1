#Requires -RunAsAdministrator

# Install Choco and the Choco packages this machine needs
Set-ExecutionPolicy Unrestricted -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Disable confirmation prompt
choco feature enable -n=allowGlobalConfirmation

# Chocolatey Packages
choco install slack
choco install 7z.install
choco install googlechrome
choco install microsoft-edge
choco install everything
choco install sysinternals
choco install vlc
choco install discord.install
choco install firacode

choco install git
choco install wget
choco install beyondcompare
choco install notepadplusplus.install
choco install vscode
microsoft-windows-terminal

choco install python3
choco install dotenetcore-sdk

choco install visualstudio2019professional
choco install visualstudio2019buildtools
choco install vcredist-all

choco install awscli
choco install docker-desktop
choco install terraform
choco install kubernetes-cli
choco install kubernetes-helm
choco install minikube
choco install postman

# Git
New-Item -Path C:\Git -ItemType Directory -Force -ErrorAction 0
New-Item -Path C:\Temp -ItemType Directory -Force -ErrorAction 0


# WSL2
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2


# copy terminal settings from github
$wtProfileContent = (Invoke-WebRequest 'https://raw.githubusercontent.com/heytred/win10-workstation/master/settings.json' -UseBasicParsing).Content
Set-Content -Value $wtProfileContent -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json"