# Restore Wacom Settings
param(
    [string]
    $MyHome
)

$MyHome = $MyHome -replace """","" -replace "`r","" -replace "`n",""
$MyHome = $MyHome.Trim()

if ([string]::IsNullOrEmpty($MyHome)) {
    $MyHome = "$env:HOME"
}

if ([string]::IsNullOrEmpty($MyHome)) {
    Write-Output "Home directory not set."
}

$path = Join-Path -Path $MyHome -ChildPath "apps\Wacom\Settings-Backup"
If (!(Test-Path $path))
{
    Write-Error "The directory for the settings ""${path}"" doesn't exist."
    Pause
    Exit 1
}

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-Not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path),"-MyHome","""${MyHome}""" -Verb RunAs
    Exit
}
else {
    Get-Service 'Wacom Professional Service' | Stop-Service
    Copy-Item -Path "${path}\WacomTouch.xml" -Destination "${MyHome}\AppData\Roaming\WTablet\WacomTouch.xml"
    Copy-Item -Path "${path}\Wacom_Tablet.dat" -Destination "${MyHome}\AppData\Roaming\WTablet\Wacom_Tablet.dat"
    Get-Service 'Wacom Professional Service' | Start-Service
}
