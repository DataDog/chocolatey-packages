$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'datadog-agent'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'Datadog Agent'
  fileType      = 'MSI'
  url64bit      = 'https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-5.14.0.msi'
  checksum64    = '0afe5730741250dc05cb298d24efc4d33783c3c6ea4a1b853445f87c40e3c79b'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
 
}

Install-ChocolateyPackage @packageArgs
