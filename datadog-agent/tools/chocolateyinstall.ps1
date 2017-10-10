$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'datadog-agent'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'Datadog Agent'
  fileType      = 'MSI'
  url64bit      = 'https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-5.18.0.msi'
  checksum64    = '30D5F148C427A26D8C52EAAD511025B3BE11442C405E28A369864214281A7290'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
 
}

Install-ChocolateyPackage @packageArgs
