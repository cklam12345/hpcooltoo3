@echo off
setlocal

:: Define variables
set "repoURL=https://git@github.com:cklam12345/hpcooltoo3.git"
set "repoDir=%~dp0hpcooltoo3"
set "shortcutName=hpcooltoo3"
set "shortcutPath=%USERPROFILE%\Desktop\%shortcutName%.lnk"
set "installDockerPath=%repoDir%\installdocker.exe"
set "targetPath=%repoDir%\docker"
set "iconPath=%repoDir%\hpcooltoo3.ico"
set "runPeriod=up"  :: Default run period is 1 minute

:: Clone the repository
echo Cloning repository...
git clone %repoURL% %repoDir%

:: Navigate to the repository directory
cd %repoDir%

:: Concatenate the split files
echo Combining split files...
type installdocker.aa installdocker.ab installdocker.ac installdocker.ad installdocker.ae installdocker.af installdocker.ag installdocker.ah installdocker.ai installdocker.aj  installdocker.ak installdocker.al installdocker.am installdocker.an installdocker.ao installdocker.ap installdocker.aq > installdocker.exe

echo install docker
%installDockerPath%


:: Create the shortcut
echo Creating desktop shortcut...
powershell -command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%shortcutPath%'); $s.TargetPath = '%targetPath%'; $s.Arguments = 'compose --profile cpu %runPeriod%'; $s.IconLocation = '%iconPath%'; $s.Save()"
echo Installation complete. Shortcut created on Desktop.

:: Reboot the machine
echo Rebooting the machine...
shutdown /r /t 0

endlocal