@echo off
:: Markus Scholtes, 2019
:: Erzeugen eines lokalen Test-Repositorys f¸r Powershell Get

md C:\Daten\PSRepo
md C:\Daten\Module
net share LocalPSRepo=C:\Daten\PSRepo /GRANT:Jeder,Change
powershell -nop -Command "Register-PSRepository -Name LocalRepo -SourceLocation '\\localhost\LocalPSRepo\' -ScriptSourceLocation '\\localhost\LocalPSRepo\' -InstallationPolicy Trusted"
echo Das Modul VirtualDesktop wird nun verîffentlicht Åber ^(wenn es in C:\Daten\Module\VirtualDesktop vorliegt^)
echo Publish-Module -Path 'C:\Daten\Module\VirtualDesktop' -Repository LocalRepo -NuGetApiKey 'AnyStringWillDo'
echo.
echo Find-Module -Repository LocalRepo
echo   zeigt dann die vorhandenen Module an
echo.
echo Install-Module -Repository LocalRepo -Name VirtualDesktop
echo   installiert das Modul VirtualDesktop

:: Struktur f¸r Version 0.0.0:
:: Modul:
:: C:\Daten\Module\VirtualDesktop\0.0.0
:: Repository:
:: C:\Daten\PSRepo\VirtualDesktop.0.0.0.nupkg

:: Entfernt wird das Repository mit:
:: powershell -nop -Command "Unregister-PSRepository -Name LocalRepo"
:: net share LocalPSRepo /delete /yes
:: Anschlieﬂend kˆnnen die Verzeichnisse C:\Daten\PSRepo und C:\Daten\Module gelˆscht werden
