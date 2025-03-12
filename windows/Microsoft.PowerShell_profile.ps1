
#Import-Module posh-git

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function fortune {
  [System.IO.File]::ReadAllText((Split-Path $profile) + '\fortune.txt') -replace "`r`n", "`n" -split "`n%`n" | Get-Random
}

function c {
  Clear-Host
  neofetch
}


Invoke-Expression (&starship init powershell)

c

fortune; cowsay ""


