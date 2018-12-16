# Backup and Restore Wacom 3 Tablet Settings

The Wacom software keeps on losing my configuration so I have created two PowerShell commands, one to backup the settings and the other to restore them.

The settings are saved into `$HOME\apps\Wacom\Settings-Backup` which is a bit of a weird place to keep it. Any pull request which changed it to `c:\ProgramData\Wacom\...` would be accepted.

Backup by running `Backup-WacomSettings` in PowerShell.

Restore by running `Restore-WacomSettings` in PowerShell. A restore requires Administrator rights so you will have to allow that.