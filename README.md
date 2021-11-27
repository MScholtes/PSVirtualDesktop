# VirtualDesktop
VirtualDesktop is a Powershell module that provides commandlets to manage virtual desktops of Windows 10.

**Now with support for Windows 11 including Insider**

* New-Desktop, Switch-Desktop, Remove-Desktop to control desktops
* Get-DesktopCount, Get-DesktopList, Get-CurrentDesktop, Get-Desktop and others to query desktops
* Move-Window, (Un)Pin-Window, (Un)Pin-Application to control windows on desktops
* only Windows 10 2004 and up: Get-DesktopName and Set-DesktopName
* only Windows 11: Move-Desktop, Remove-AllDesktops, Set-DesktopWallpaper and Set-AllDesktopWallpapers

and other commandlets

By Markus Scholtes, 2021

## Sample Session
```powershell
# Create a new virtual desktop and switch to it
New-Desktop | Switch-Desktop

# Create a new virtual desktop and name it (only on Win 10 2004 or up)
New-Desktop | Set-DesktopName -Name "The new one"

# Get second virtual desktop (count starts with 0) and remove it
Get-Desktop 1 | Remove-Desktop -Verbose

# Retrieves the count of virtual desktops
Get-DesktopCount

# Show list of virtual desktops
Get-DesktopList

# Move notepad window to current virtual desktop
(ps notepad)[0].MainWindowHandle | Move-Window (Get-CurrentDesktop) | Out-Null

# Move powershell window to last virtual desktop and switch to it
Get-Desktop ((Get-DesktopCount)-1) | Move-Window (Get-ConsoleHandle) | Switch-Desktop

# Retrieve virtual desktop on which notepad runs and switch to it
Get-DesktopFromWindow ((Get-Process "notepad")[0].MainWindowHandle) | Switch-Desktop

# Pin notepad to all desktops
Pin-Window ((Get-Process "notepad")[0].MainWindowHandle)
```
## Installation

```powershell
PS C:\> Install-Module VirtualDesktop
```
or download from here: https://www.powershellgallery.com/packages/VirtualDesktop/.

Also look for the script based version here [Powershell commands to manage virtual desktops of Windows 10](https://github.com/MScholtes/TechNet-Gallery/tree/master/VirtualDesktop).

Also look for the C# partner tool here [VirtualDesktop](https://github.com/MScholtes/VirtualDesktop).

## List Of Commands
In most commands you can use a desktop object, the desktop number or a part of the desktop name as parameter desktop, see online help for more information.

### Get-DesktopCount
Get count of virtual desktops
### Get-DesktopList
Show list of virtual desktops
### New-Desktop
Create virtual desktop. Returns desktop object.
### Switch-Desktop -Desktop desktop
Switch to virtual desktop. Parameter is number of desktop (starting with 0 to count-1) or desktop object.
### Remove-Desktop -Desktop desktop
Remove virtual desktop. Parameter is number of desktop (starting with 0 to count-1) or desktop object.
Windows on the desktop to be removed are moved to the virtual desktop to the left except for desktop 0 where the
second desktop is used instead. If the current desktop is removed, this fallback desktop is activated too.
If no parameter is supplied, the last desktop is removed.
### Remove-AllDesktops
Remove all virtual desktops but visible. Works only on Windows 11.
### Get-CurrentDesktop
Get current virtual desktop as desktop object.
### Get-Desktop -Index index
Get virtual desktop with index number (0 to count-1). Returns desktop object.
### Get-DesktopIndex -Desktop desktop
Get index number (0 to count-1) of virtual desktop. Returns integer or -1 if not found.
### Get-DesktopName -Desktop desktop
Get name of virtual desktop. Returns string.
### Set-DesktopName -Desktop desktop -Name name -PassThru
Set name of virtual desktop to name. Works only on Windows 10 2004 or up and not with Powershell Core 7.1 and up!
### Set-DesktopWallpaper -Desktop desktop -Path path -PassThru
Set wallpaper of virtual desktop to path. Works only on Windows 11.
### Set-AllDesktopWallpapers -Path path
Set wallpaper of all virtual desktops to path. Works only on Windows 11.
### Get-DesktopFromWindow -Hwnd hwnd
Get virtual desktop of window (whose window handle is passed). Returns desktop object.
### Test-CurrentDesktop -Desktop desktop
Checks whether a desktop is the currently displayed virtual desktop. Returns boolean.
### Get-LeftDesktop -Desktop desktop
Get the desktop object on the "left" side. If there is no desktop on the "left" side $NULL is returned.
Returns desktop "left" to current desktop if parameter desktop is omitted.
### Get-RightDesktop -Desktop desktop
Get the desktop object on the "right" side.If there is no desktop on the "right" side $NULL is returned.
Returns desktop "right" to current desktop if parameter desktop is omitted.
### Move-Desktop -Desktop desktop
Move current desktop to other virtual desktop. Works only on Windows 11.
### Move-Window -Desktop desktop -Hwnd hwnd
Move window whose handle is passed to virtual desktop.
The parameter values are auto detected and can change places. The desktop object is handed to the output pipeline for further use.
If parameter desktop is omitted, the current desktop is used.
### Move-ActiveWindow -Desktop desktop
Move active window to virtual desktop.
The desktop object is handed to the output pipeline for further use.
If parameter desktop is omitted, the current desktop is used.
### Test-Window -Desktop desktop -Hwnd hwnd
Check if window whose handle is passed is displayed on virtual desktop. Returns boolean.
The parameter values are auto detected and can change places. If parameter desktop is not supplied, the current desktop is used.
### Pin-Window -Hwnd hwnd
Pin window whose window handle is given to all desktops.
### Unpin-Window -Hwnd hwnd
Unpin window whose window handle is given to all desktops.
### Test-WindowPinned -Hwnd hwnd
Checks whether a window whose window handle is given is pinned to all desktops. Returns boolean.
### Pin-Application -Hwnd hwnd
Pin application whose window handle is given to all desktops.
### Unpin-Application -Hwnd hwnd
Unpin application whose window handle is given to all desktops.
### Test-ApplicationPinned -Hwnd hwnd
Checks whether an application whose window handle is given is pinned to all desktops. Returns boolean.
### Get-ConsoleHandle
Get window handle of powershell console in a safe way (means: if powershell is started in a cmd window, the cmd window handle is returned).
### Get-ActiveWindowHandle
Get window handle of foreground window (the foreground window is always on the current virtual desktop).
### Find-WindowHandle
Find first window handle to title text or retrieve list of windows with title (when called with * as parameter)

## Versions
### 1.4.1, 2021-11-27
- support for Windows 11 Insider build 22449 and up
- version 1.3.2 should have been 1.4.0, so this is 1.4.1
### 1.3.2, 2021-10-22
- support for Windows 10 21H2 and Windows 11
- Set-DesktopName works on current virtual desktop if parameter -desktop is missing
### 1.3.1, 2021-02-28
- fixes for Get-DesktopIndex
### 1.3.0, 2020-11-28
- compatible to Powershell Core 7.0 (but not 7.1 or up)
- parameter -PassThru for Set-DesktopName (by sirAndros)
### 1.2.0, 2020-06-27
- support for desktop names introduced with Win 10 2004
- new functions Get-DesktopList, Get-DesktopName and Set-DesktopName
- desktop name as parameter for many functions
- support for verbose output
### 1.1.0, 2019-09-04
- new function Find-WindowHandle
### 1.0.1, 2019-08-22
- fixed examples
### 1.0.0, 2019-06-03
- first stable release (hope so)
### 0.0.0, 2019-05-20
- test release
