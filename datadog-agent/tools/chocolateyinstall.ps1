$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'datadog-agent'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'Datadog Agent'
  fileType      = 'MSI'
  url64bit      = 'https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-5.19.0.msi'
  checksum64    = 'E4B5568265CBB57C37DE7D5CC95BC32248F01E926D1F4363CCD8955061D8B94E'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
 
}

Install-ChocolateyPackage @packageArgs
