@echo off
:start
set /p kdex=":" || goto start
for /f "tokens=2 delims=, skip=%kdex%" %%A in (..\..\data\pokemonStats.txt) do (
	set name=%%A
	goto fin
)
:fin
echo %name%
timeout 2 >nul
start microsoft-edge:"http://pokemondb.net/sprites/%name%"
goto start