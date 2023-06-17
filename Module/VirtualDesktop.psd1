#
# Module manifest for module 'VirtualDesktop'
#
# Generated by: Markus Scholtes
#
# Generated on: 2023-06-11
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'VirtualDesktop.psm1'

# Version number of this module.
ModuleVersion = '1.5.3'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'ff25bfed-b11c-4280-9ded-bee5870696d6'

# Author of this module
Author = 'Markus Scholtes'

# Company or vendor of this module
CompanyName = ''

# Copyright statement for this module
Copyright = '(c) Markus Scholtes 2023'

# Description of the functionality provided by this module
Description = @'
VirtualDesktop is a module that provides commandlets to manage virtual desktops of Windows 10 and 11.

* New-Desktop, Switch-Desktop, Remove-Desktop to control desktops
* Get-DesktopCount, Get-CurrentDesktop, Get-Desktop and others to query desktops
* Move-Window, (Un)Pin-Window, (Un)Pin-Application to control windows on desktops
* only Windows 10 2004 and up: Get-DesktopName and Set-DesktopName
* only Windows 11: Move-Desktop, Remove-AllDesktops, Set-DesktopWallpaper and Set-AllDesktopWallpapers
and other commandlets
'@

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.5'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
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

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

	PSData = @{
		# Tags applied to this module. These help with module discovery in online galleries.
		Tags = @('Windows', 'Desktop', 'Virtualdesktop', 'Window')

		# A URL to the license for this module.
		LicenseUri = 'https://github.com/MScholtes/PSVirtualDesktop/blob/master/LICENSE'

		# A URL to the main website for this project.
		ProjectUri = 'https://github.com/MScholtes/PSVirtualDesktop'

		# A URL to an icon representing this module.
		# IconUri = ''

		# ReleaseNotes of this module
		ReleaseNotes = @'
# 1.5.3 / 2023-06-11
- no flashing icons after switch desktops
# 1.5.2 / 2023-02-19
- support for Windows 11 Insider 25276+
# 1.5.1 / 2022-07-29
- bug fix: desktop for pinned windows and apps are recognized
# 1.5.0 / 2022-03-16
- support for Powershell Core
- support for Windows Server 2022
- support for Windows Terminal
# 1.4.1 / 2021-11-27
- support for Windows 11 Insider build 22449 and up
- version 1.3.2 should have been 1.4.0, so this is 1.4.1
# 1.3.2 / 2021-10-22
- support for Windows 10 21H2 and Windows 11
- Set-DesktopName works on current virtual desktop if parameter -desktop is missing
# 1.3.1 / 2021-02-28
- fixes for Get-DesktopIndex
# 1.3.0 / 2020-11-28
- compatible to Powershell Core 7.0 (but not 7.1 or up)
- parameter -PassThru for Set-DesktopName (by sirAndros)
# 1.2.0 / 2020-06-27
- support for desktop names introduced with Win 10 2004
- new functions Get-DesktopList, Get-DesktopName and Set-DesktopName
- desktop name as parameter for many functions
- support for verbose output
# 1.1.0 / 2019-09-04
- new function Find-WindowHandle
# 1.0.1 / 2019-08-22
- Fixed examples
# 1.0.0 / 2019-06-03
- First stable release (hope so)
'@
	} # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
