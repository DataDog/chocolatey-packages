$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Datadog Agent'
  fileType      = 'msi'
  url64bit      = "https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli-$($env:chocolateyPackageVersion).msi"
  checksum64    = '2942e9ce2105261a28dd6c7ed5e4df6ad965c8254aea1c5b1c463ab437174b27'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($env:ChocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
