$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'datadog-agent'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'Datadog Agent'
  fileType      = 'MSI'
  url64bit      = 'https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-5.17.1.msi'
  checksum64    = '22EFEDE65E6C86DC884F1861BF252D175B13AC902882058258B03568DD4AD1C3'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
 
}

Install-ChocolateyPackage @packageArgs
