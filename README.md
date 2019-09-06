# VirtualDesktop
VirtualDesktop is a Powershell module that provides commandlets to manage virtual desktops of Windows 10.


* New-Desktop, Switch-Desktop, Remove-Desktop to control desktops
* Get-DesktopCount, Get-CurrentDesktop, Get-Desktop and others to query desktops
* Move-Window, (Un)Pin-Window, (Un)Pin-Application to control windows on desktops

and other commandlets

By Markus Scholtes, 2019
## Sample Session
```powershell
# Create a new virtual desktop and switch to it
New-Desktop | Switch-Desktop

# Get second virtual desktop (count starts with 0) and remove it
Get-Desktop 1 | Remove-Desktop

# Retrieves the count of virtual desktops
Get-DesktopCount

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

Also look for the script based version here [Powershell commands to manage virtual desktops of Windows 10](https://gallery.technet.microsoft.com/scriptcenter/Powershell-commands-to-d0e79cc5).
## List Of Commands
### Get-DesktopCount
Get count of virtual desktops
### New-Desktop
Create virtual desktop. Returns desktop object.
### Switch-Desktop -Desktop desktop
Switch to virtual desktop. Parameter is number of desktop (starting with 0 to count-1) or desktop object.
### Remove-Desktop -Desktop desktop
Remove virtual desktop. Parameter is number of desktop (starting with 0 to count-1) or desktop object.
Windows on the desktop to be removed are moved to the virtual desktop to the left except for desktop 0 where the
second desktop is used instead. If the current desktop is removed, this fallback desktop is activated too.
If no parameter is supplied, the last desktop is removed.
### Get-CurrentDesktop
Get current virtual desktop as desktop object.
### Get-Desktop -Index index
Get virtual desktop with index number (0 to count-1). Returns desktop object.
### Get-DesktopIndex -Desktop desktop
Get index number (0 to count-1) of virtual desktop. Returns integer or -1 if not found.
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
### 1.1.0, 2019-09-04
New function Find-WindowHandle
### 1.0.1, 2019-08-22
Fixed examples
### 1.0.0, 2019-06-03
First stable release (hope so)
### 0.0.0, 2019-05-20
Test release
