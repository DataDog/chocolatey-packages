$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Datadog Agent'
  fileType      = 'msi'
  url64bit      = "https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-$($env:chocolateyPackageVersion).msi"
  checksum64    = '66b610c02dd97a9063b92e1a48eb400f23fcdb5774d641b084ad7818fdafdd0c'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($env:ChocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
