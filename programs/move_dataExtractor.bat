@echo off
setLocal EnableDelayedExpansion
if exist data\tempFiles\temp_stats.txt del /q data\tempFiles\temp_stats.txt
set skip=%~1

:standardCase
for /f "tokens=2 delims=, skip=%skip%" %%A in (data\moveStats.txt) do (
	set moveName=%%A
	goto next1
)
:next1
for /f "tokens=3 delims=, skip=%skip%" %%A in (data\moveStats.txt) do (
	set moveType=%%A
	goto next2
)
:next2
for /f "tokens=4 delims=, skip=%skip%" %%A in (data\moveStats.txt) do (
	set pwr=%%A
	goto next3
)
:next3
for /f "tokens=5 delims=, skip=%skip%" %%A in (data\moveStats.txt) do (
	set acc=%%A
	goto next4
)
:next4
for /f "tokens=6 delims=, skip=%skip%" %%A in (data\moveStats.txt) do (
	set pp=%%A
	goto next5
)
:next5
echo %moveName%,%moveType%,%pwr%,%acc%,%pp%>data\tempFiles\temp_stats.txt