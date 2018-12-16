# Save Wacom Settings

$path = "${env:HOME}\apps\Wacom\Settings-Backup"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Path $path
}

Copy-Item -Path "${env:HOME}\AppData\Roaming\WTablet\WacomTouch.xml" -Destination "${path}\WacomTouch.xml"
Copy-Item -Path "${env:HOME}\AppData\Roaming\WTablet\Wacom_Tablet.dat" -Destination "${path}\Wacom_Tablet.dat"