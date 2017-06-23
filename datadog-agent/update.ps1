import-module au

$release_url    = 'https://s3.amazonaws.com/ddagent-windows-stable/installers.json'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"     = "`$1'$($Latest.URL64)'"
			 "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            "(\<version\>).*?(\</version\>)" = "`${1}$($Latest.Version)`$2"
        }
    }
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $release_url
	$object = ($download_page.Content | ConvertFrom-Json)
	$latest_release = ($object.psobject.properties.name | %{[System.Version]$_} | Sort-Object -Descending | select -First 1).ToString()
	$latest_release_url = $object.$latest_release.amd64

    return @{
        URL64        = $latest_release_url
        Version      = $latest_release
    }
}

update -ChecksumFor 64