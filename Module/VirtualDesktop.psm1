<#
.SYNOPSIS
VirtualDesktop is a module that provides commandlets to manage virtual desktops of Windows 10.
.NOTES
Version: 1.3.2
Date: 2021-10-22
Author: Markus Scholtes
#>

# check for integrity of the source files
if (!(Test-Path "$PSScriptRoot/functions.cat"))
{
	Write-Error "Cannot load module because files are missing"
	exit
}
if (Get-Command Test-FileCatalog -EA SilentlyContinue)
{ # available only from Powershell 5.1 on
	if ((Test-FileCatalog -Path "$PSScriptRoot/VirtualDesktop.ps1" -Detailed -CatalogFilePath "$PSScriptRoot/functions.cat").Status -ne "Valid")
	{ # cancel because files have been changed
		Write-Error "Cannot load module because files have been modified"
		exit
	}
}

# Load modules manually for security reasons
. "$PSScriptRoot/VirtualDesktop.ps1"

# Export functions
Export-ModuleMember -Function @(
	'Get-DesktopCount',
	'Get-DesktopList',
	'New-Desktop',
	'Switch-Desktop',
	'Remove-Desktop',
	'Remove-AllDesktops',
	'Get-CurrentDesktop',
	'Get-Desktop',
	'Get-DesktopIndex',
	'Get-DesktopName',
	'Set-DesktopName',
	'Set-DesktopWallpaper',
	'Set-AllDesktopWallpapers',
	'Get-DesktopFromWindow',
	'Test-CurrentDesktop',
	'Get-LeftDesktop',
	'Get-RightDesktop',
	'Move-Desktop',
	'Move-Window',
	'Move-ActiveWindow',
	'Test-Window',
	'Pin-Window',
	'Unpin-Window',
	'Test-WindowPinned',
	'Pin-Application',
	'Unpin-Application',
	'Test-ApplicationPinned',
	'Get-ConsoleHandle',
	'Get-ActiveWindowHandle',
	'Find-WindowHandle'
)
