@echo off

SETLOCAL ENABLEEXTENSIONS
pushd

rem path where build.cmd is (root of project by convention)
set $path=%~dp0

cd "%$path%"
set $root=

rem get only folder name in $root
for %%* in (.) do @set "$root=%%~n*"

popd


md dist 1>nul 2>nul

SET GOOS=linux
SET GOARCH=arm
go build -ldflags "-s -w" -o "%$path%dist\%GOOS%\%GOARCH%\%$root%" "%$path%main.go"

SET GOOS=linux
SET GOARCH=arm64
go build -ldflags "-s -w" -o "%$path%dist\%GOOS%\%GOARCH%\%$root%" "%$path%main.go"

SET GOOS=linux
SET GOARCH=amd64
go build -ldflags "-s -w" -o "%$path%dist\%GOOS%\%GOARCH%\%$root%" "%$path%main.go"

SET GOOS=windows
SET GOARCH=amd64
go build -ldflags "-s -w" -o "%$path%dist\%GOOS%\%GOARCH%\%$root%.exe" "%$path%main.go"

SET GOOS=windows
SET GOARCH=386
go build -ldflags "-s -w" -o "%$path%dist\%GOOS%\%GOARCH%\%$root%.exe" "%$path%main.go"


ENDLOCAL
