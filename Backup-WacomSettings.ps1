# Save Wacom Settings
param(
    [string]
    $MyHome
)
if ([string]::IsNullOrEmpty($MyHome)) {
    $MyHome = "$env:HOME"
}

if ([string]::IsNullOrEmpty($MyHome)) {
      Write-Output "Home directory not set."
}

$savePath = Join-Path -Path $MyHome -ChildPath "apps\Wacom\Settings-Backup"
$sourcePath = Join-Path -Path $MyHome -ChildPath "AppData\Roaming\WTablet"
If(!(test-path $savePath))
{
      New-Item -ItemType Directory -Path $savePath
}

Copy-Item -Path "$sourcePath\WacomTouch.xml" -Destination "${savePath}\WacomTouch.xml"
Copy-Item -Path "$sourcePath\Wacom_Tablet.dat" -Destination "${savePath}\Wacom_Tablet.dat"