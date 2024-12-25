@echo off
setlocal

:: Define variables
set "repoURL=git@github.com:cklam12345/hpcooltoo3.git"
set "repoDir=%~dp0hpcooltoo3"
set "shortcutName=hpcooltoo3"
set "shortcutPath=%USERPROFILE%\Desktop\%shortcutName%.lnk"
set "installDockerPath=%repoDir%\installdocker.exe"
set "installollama=%repoDir%\ollama.exe"
set "targetPath=docker"

set "iconPath=%repoDir%\hpcooltoo3.ico"
set "runPeriod=compose"  :: Default run period is 1 minute
set "runPeriod2=--profile"
set "runPeriod3=cpu"
set "runPeriod4=up"

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

echo install ollama
type ollama.aa ollama.ab ollama.ac ollama.ad ollama.ae ollama.af ollama.ag ollama.ah > ollama.exe
%installollama%
cmd /c ollama pull llama3.2
cmd /c ollama pull nomic-embed-text

:: Create the shortcut
echo Creating desktop shortcut...
powershell -command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%shortcutPath%'); $s.WorkingDirectory = '%repoDir%'; $s.TargetPath = 'cmd.exe'; $s.Arguments = '/c cd /d %repoDir% && %targetPath% %runPeriod% %runPeriod2% %runPeriod3% %runPeriod4%'; $s.IconLocation = '%iconPath%'; $s.Save()"
echo Installation complete. Shortcut created on Desktop.

:: Reboot the machine
echo Rebooting the machine...
shutdown /r /t 0

endlocal
