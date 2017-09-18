$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'datadog-agent'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'Datadog Agent'
  fileType      = 'MSI'
  url64bit      = 'https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-5.17.2.msi'
  checksum64    = '1CE9E97D25C902439839E9D7ADC36F3B05D97B3DCC2C5944021D4770EF509AE4'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
 
}

Install-ChocolateyPackage @packageArgs
