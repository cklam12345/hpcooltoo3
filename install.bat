@echo off

:: Step 1: Clone the Repositories
echo Cloning repositories...
if not exist hpcooltoo3 (
    git clone git@github.com:cklam12345/hpcooltoo3.git
)

:: Step 2: Build Docker Images 
echo Building Docker images... 
cd hpcooltoo3 
type installdocker.aa installdocker.ab installdocker.ac installdocker.ad installdocker.ae installdocker.af installdocker.ag installdocker.ah installdocker.ai installdocker.aj  > installdocker.exe
start /wait installdocker.exe
docker compose --profile cpu up