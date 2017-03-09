rem @echo off
setLocal EnableDelayedExpansion

set filePath_player1=%~1
set filePath_player2=%~2

rem obtain Pokemon 1 data
for /f "tokens=1 delims=," %%A in (%filePath_player1%) do (set name_pokemon1=%%A)
for /f "tokens=2 delims=," %%A in (%filePath_player1%) do (set nknm_pokemon1=%%A)
for /f "tokens=3 delims=," %%A in (%filePath_player1%) do (set hp_pokemon1=%%A)
for /f "tokens=4 delims=," %%A in (%filePath_player1%) do (set atk_pokemon1=%%A)
for /f "tokens=5 delims=," %%A in (%filePath_player1%) do (set def_pokemon1=%%A)
for /f "tokens=6 delims=," %%A in (%filePath_player1%) do (set spd_pokemon1=%%A)
for /f "tokens=7 delims=," %%A in (%filePath_player1%) do (set spc_pokemon1=%%A)
for /f "tokens=8 delims=," %%A in (%filePath_player1%) do (set lvl_pokemon1=%%A)
for /f "tokens=9 delims=," %%A in (%filePath_player1%) do (set dexNo_pokemon1=%%A)
for /f "tokens=10 delims=," %%A in (%filePath_player1%) do (set move1No_pokemon1=%%A)
for /f "tokens=11 delims=," %%A in (%filePath_player1%) do (set move2No_pokemon1=%%A)
for /f "tokens=6 delims=, skip=%dexNo_pokemon1%" %%A in (data\pokemonStats.txt) do (
	set baseSpeed_pokemon1=%%A
	goto a1next1
)
:a1next1
for /f "tokens=8 delims=, skip=%dexNo_pokemon1%" %%A in (data\pokemonStats.txt) do (
	set type1_pokemon1=%%A
	goto a1next2
)
:a1next2

for /f "tokens=9 delims=, skip=%dexNo_pokemon1%" %%A in (data\pokemonStats.txt) do (
	set type2_pokemon1=%%A
	goto a1next3
)
:a1next3
for /f "tokens=2 delims=, skip=%dexNo_pokemon1%" %%A in (data\pokemonStats.txt) do (
	set species_pokemon1=%%A
	goto a1next4
)
:a1next4
for /f "tokens=2 delims=, skip=%move1No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move1Name_pokemon1=%%A
	goto 1next1
)
:1next1
for /f "tokens=3 delims=, skip=%move1No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move1Type_pokemon1=%%A
	goto 1next2
)
:1next2
for /f "tokens=4 delims=, skip=%move1No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move1Pwr_pokemon1=%%A
	goto 1next3
)
:1next3
for /f "tokens=5 delims=, skip=%move1No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move1Acc_pokemon1=%%A
	goto 1next4
)
:1next4
for /f "tokens=6 delims=, skip=%move1No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move1Pp_pokemon1=%%A
	goto 1next5
)
:1next5
for /f "tokens=2 delims=, skip=%move2No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move2Name_pokemon1=%%A
	goto 1next6
)
:1next6
for /f "tokens=3 delims=, skip=%move2No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move2Type_pokemon1=%%A
	goto 1next7
)
:1next7
for /f "tokens=4 delims=, skip=%move2No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move2Pwr_pokemon1=%%A
	goto 1next8
)
:1next8
for /f "tokens=5 delims=, skip=%move2No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move2Acc_pokemon1=%%A
	goto 1next9
)
:1next9
for /f "tokens=6 delims=, skip=%move2No_pokemon1%" %%A in (data\moveStats.txt) do (
	set move2Pp_pokemon1=%%A
	goto 1next0
)
:1next0
set /a "accRate_pokemon1=100"
set /a "evaRate_pokemon1=100"


rem Obtain Pokemon 2 data
for /f "tokens=1 delims=," %%A in (%filePath_player2%) do (set name_pokemon2=%%A)
for /f "tokens=2 delims=," %%A in (%filePath_player2%) do (set hp_pokemon2=%%A)
for /f "tokens=3 delims=," %%A in (%filePath_player2%) do (set atk_pokemon2=%%A)
for /f "tokens=4 delims=," %%A in (%filePath_player2%) do (set def_pokemon2=%%A)
for /f "tokens=5 delims=," %%A in (%filePath_player2%) do (set spd_pokemon2=%%A)
for /f "tokens=6 delims=," %%A in (%filePath_player2%) do (set spc_pokemon2=%%A)
for /f "tokens=7 delims=," %%A in (%filePath_player2%) do (set lvl_pokemon2=%%A)
for /f "tokens=8 delims=," %%A in (%filePath_player2%) do (set dexNo_pokemon2=%%A)
for /f "tokens=9 delims=," %%A in (%filePath_player2%) do (set move1No_pokemon2=%%A)
for /f "tokens=10 delims=," %%A in (%filePath_player2%) do (set move2No_pokemon2=%%A)
for /f "tokens=6 delims=, skip=%dexNo_pokemon2%" %%A in (data\pokemonStats.txt) do (
	set baseSpeed_pokemon2=%%A
	goto a2next1
)
:a2next1
for /f "tokens=8 delims=, skip=%dexNo_pokemon1%" %%A in (data\pokemonStats.txt) do (
	set type1_pokemon2=%%A
	goto a2next2
)
:a2next2
for /f "tokens=9 delims=, skip=%dexNo_pokemon2%" %%A in (data\pokemonStats.txt) do (
	set type2_pokemon2=%%A
	goto a2next3
)
pause
:a2next3
for /f "tokens=2 delims=, skip=%dexNo_pokemon2%" %%A in (data\pokemonStats.txt) do (
	set species_pokemon2=%%A
	goto a2next4
)
:a2next4
for /f "tokens=2 delims=, skip=%move1No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move1Name_pokemon2=%%A
	goto 2next1
)
:2next1
for /f "tokens=3 delims=, skip=%move1No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move1Type_pokemon2=%%A
	goto 2next2
)
:2next2
for /f "tokens=4 delims=, skip=%move1No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move1Pwr_pokemon2=%%A
	goto 2next3
)
:2next3
for /f "tokens=5 delims=, skip=%move1No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move1Acc_pokemon2=%%A
	goto 2next4
)
:2next4
for /f "tokens=6 delims=, skip=%move1No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move1Pp_pokemon2=%%A
	goto 2next5
)
:2next5
for /f "tokens=2 delims=, skip=%move2No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move2Name_pokemon2=%%A
	goto 2next6
)
:2next6
for /f "tokens=3 delims=, skip=%move2No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move2Type_pokemon2=%%A
	goto 2next7
)
:2next7
for /f "tokens=4 delims=, skip=%move2No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move2Pwr_pokemon2=%%A
	goto 2next8
)
:2next8
for /f "tokens=5 delims=, skip=%move2No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move2Acc_pokemon2=%%A
	goto 2next9
)
:2next9
for /f "tokens=6 delims=, skip=%move2No_pokemon2%" %%A in (data\moveStats.txt) do (
	set move2Pp_pokemon2=%%A
	goto 2next0
)
:2next0
set /a "accRate_pokemon1=100"
set /a "evaRate_pokemon1=100"

set currentHp_pokemon1=%hp_pokemon1%
set currentHp_pokemon2=%hp_pokemon2%
set currentPp_move1_pokemon1=%move1Pp_pokemon1%
set currentPp_move1_pokemon2=%move1Pp_pokemon2%
set currentPp_move2_pokemon1=%move2Pp_pokemon1%
set currentPp_move2_pokemon2=%move2Pp_pokemon2%
set currentPp_move3_pokemon1=%move3Pp_pokemon1%
set currentPp_move3_pokemon2=%move3Pp_pokemon2%
set currentPp_move4_pokemon1=%move4Pp_pokemon1%
set currentPp_move4_pokemon2=%move4Pp_pokemon2%
if %move1Pwr_pokemon1%==??? set move1Pwr_pokemon1=0
if %move1Pwr_pokemon2%==??? set move1Pwr_pokemon2=0
if %move2Pwr_pokemon1%==??? set move2Pwr_pokemon1=0
if %move2Pwr_pokemon2%==??? set move2Pwr_pokemon2=0
if %type2_pokemon1%==??? set type2_pokemon1=0
if %type2_pokemon2%==??? set type2_pokemon2=0
set 'sts_pokemon1='
set 'sts_pokemon2='

:battleGUI
for /f "tokens=7 delims=," %%A in (%filePath_player1%) do (set lvl_pokemon1=%%A)
for /f "tokens=7 delims=," %%A in (%filePath_player2%) do (set lvl_pokemon2=%%A)
color 70
cls
echo(
echo   %name_pokemon2%
echo  ________________
echo / HP: %currentHp_pokemon2%/%hp_pokemon2%
type                                                                         assets\sprites\%species_pokemon2%_frontSprite.txt
echo(
echo(
echo(
echo(
echo(
type assets\sprites\%species_pokemon1%_backSprite.txt
echo(
echo                                  %nknm_pokemon1%
echo                                 ________________
echo                                / HP: %currentHp_pokemon1%/%hp_pokemon1%
echo OPTIONS
echo FIGHT (1)
echo PkMn (2)
echo ITEM (3)
echo RUN (4)
set /p choice=":" || goto battleGUI
if %choice% equ 1 (
	goto fight
) else (
	if %choice% equ 2 (
		goto pokemon
	) else (
		if %choice% equ 3 (
			goto item
		) else (
			if %choice% equ 4 (
				goto run
			) else (
				goto battleGUI
			)
		)
	)
)

:fight
echo OPTIONS
if defined move1Name_pokemon1  (echo %move1Name_pokemon1% %currentPp_move1_pokemon1%/%move1Pp_pokemon1% ^(1^)) else (echo  - )
if defined move2Name_pokemon1  (echo %move2Name_pokemon1% %currentPp_move2_pokemon1%/%move2Pp_pokemon1% ^(2^)) else (echo  - )
if defined move3Name_pokemon1  (echo %move3Name_pokemon1% %currentPp_move3_pokemon1%/%move3Pp_pokemon1% ^(3^)) else (echo  - )
if defined move4Name_pokemon1  (echo %move4Name_pokemon1% %currentPp_move4_pokemon1%/%move4Pp_pokemon1% ^(4^)) else (echo  - )
set /p selMove_pokemon1=":" || goto fight
if !currentPp_move%selMove_pokemon1%_pokemon1! leq 0 (
	echo No PP left
	pause >nul
	goto fight
)
set selMove_pokemon2=1
if !currentPp_move%selMove_pokemon2%_pokemon2! leq 0 (
	goto fainted_player2
)
goto battleCalc
:pokemon
cls
echo Switch Pokemon
if defined name_pokemon1  (echo %name_pokemon1% %currentHp_pokemon1%/%hp_pokemon1%) else (echo  - )
if defined name_pokemon2 (echo %pokemon2% %currentHp_1pokemon2%/%hp_pokemon1%) else (echo  - )
if defined name_pokemon3 (echo %pokemon3% %currentHp_1pokemon3%/%hp_pokemon1%) else (echo  - )
if defined name_pokemon4 (echo %pokemon4% %currentHp_1pokemon4%/%hp_pokemon1%) else (echo  - )
if defined name_pokemon5 (echo %pokemon5% %currentHp_1pokemon5%/%hp_pokemon1%) else (echo  - )
if defined name_pokemon6 (echo %pokemon6% %currentHp_1pokemon6%/%hp_pokemon1%) else (echo  - )
pause >nul
goto battleGUI
echo
:item

:run
echo There's no running from a trainer battle
pause >nul
goto battleGUI
:battleCalc

if /i !move%selMove_pokemon1%Type_pokemon1! == Normal (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Fighting (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Flying (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Ground (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Rock (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Bug (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Ghost (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Poison (
	set atk1=%atk_pokemon1%
	set def2=%def_pokemon2%
)

if /i !move%selMove_pokemon1%Type_pokemon1! == Water (
	set atk1=%spc_pokemon1%
	set def2=%spc_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Grass (
	set atk1=%spc_pokemon1%
	set def2=%spc_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Fire (
	set atk1=%spc_pokemon1%
	set def2=%spc_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Ice set (
	set atk1=%spc_pokemon1%
	set def2=%spc_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Electric (
	set atk1=%spc_pokemon1%
	set def2=%spc_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Psychic (
	set atk1=%spc_pokemon1%
	set def2=%spc_pokemon2%
)
if /i !move%selMove_pokemon1%Type_pokemon1! == Dragon (
	set atk1=%spc_pokemon1%
	set def2=%spc_pokemon2%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Normal (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Fighting (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Flying (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Ground (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Rock (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Bug (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Ghost (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Poison (
	set atk2=%atk_pokemon2%
	set def1=%def_pokemon1%
)

if /i !move%selMove_pokemon2%Type_pokemon2! == Water (
	set atk2=%spc_pokemon2%
	set def1=%spc_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Grass (
	set atk2=%spc_pokemon2%
	set def1=%spc_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Fire (
	set atk2=%spc_pokemon2%
	set def1=%spc_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Ice (
	set atk2=%spc_pokemon2%
	set def1=%spc_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Electric (
	set atk2=%spc_pokemon2%
	set def1=%spc_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Psychic (
	set atk2=%spc_pokemon2%
	set def1=%spc_pokemon1%
)
if /i !move%selMove_pokemon2%Type_pokemon2! == Dragon (
	set atk2=%spc_pokemon2%
	set def1=%spc_pokemon1%
)


if !move%selMove_pokemon1%Type_pokemon1!==%type1_pokemon1% (
	set stab_pokemon1=15
	goto b1next1
) else (
	set stab_pokemon1=10
) || set stab_pokemon1=10

if !move%selMove_pokemon1%Type_pokemon1!==%type2_pokemon1% (
	set stab_pokemon1=15
	goto b1next1
) else (
	set stab_pokemon1=10
) || set stab_pokemon1=10
:b1next1
(set type_pokemon1=1) || set type_pokemon1=1
set /a "threshold_pokemon1=%baseSpeed_pokemon1%/2"
set /a "critRand_pokemon1=((%random%)%%256)"
if %critRand_pokemon1% lss %threshold_pokemon1% (set /a "lvl_pokemon1=lvl_pokemon1*2" & set crit_pokemon1=1) else (set crit_pokemon1=0)|| set crit_pokemon1=0
set /a "rand_pokemon1=100-((%random%)%%16)" || set rand_pokemon1=1
set /a mod_pokemon1="(%stab_pokemon1%*%type_pokemon1%*%rand_pokemon1%)"



if !move%selMove_pokemon2%Type_pokemon2!==%type1_pokemon2% (
	set stab_pokemon2=15
	goto b1next2
) else (
	set stab_pokemon2=10
) || set stab_pokemon2=10

if !move%selMove_pokemon1%Type_pokemon2!==%type2_pokemon2% (
	set stab_pokemon2=15
	goto b1next2
) else (
	set stab_pokemon2=10
) || set stab_pokemon2=10
:b1next2
(set type_pokemon2=1) || set type_pokemon2=1
set /a "threshold_pokemon2=%baseSpeed_pokemon2%/2"
set /a "critRand_pokemon2=((%random%)%%256)"
if %critRand_pokemon2% lss %threshold_pokemon2% (set /a "lvl_pokemon2=lvl_pokemon2*2" & set crit_pokemon2=1) else (set crit_pokemon2=0)|| set crit_pokemon2=0
set /a "rand_pokemon2=100-((%random%)%%16)" || set rand_pokemon2=1
set /a mod_pokemon2="(%stab_pokemon2%*%type_pokemon2%*%rand_pokemon2%)"

set selMovePwr_pokemon1=!move%selMove_pokemon1%Pwr_pokemon1!
set selMovePwr_pokemon2=!move%selMove_pokemon2%Pwr_pokemon2!
set /a "damageDealt_pokemon1=(((((2*%lvl_Pokemon1%+10)*%atk1%*%selMovePwr_pokemon1%)/(250*%def2%))+2)*%mod_pokemon1%)/1000"
set /a "damageDealt_pokemon2=(((((2*%lvl_Pokemon2%+10)*%atk2%*%selMovePwr_pokemon2%)/(250*%def1%))+2)*%mod_pokemon2%)/1000"
rem echo %spd_pokemon1% %spd_pokemon2%
if %spd_pokemon2% lss %spd_pokemon1% (goto pokemon1first)
if %spd_pokemon2% gtr %spd_pokemon1% (goto pokemon2first)
if %spd_pokemon2% equ %spd_pokemon1% (
	set /a "x=%random% %% 2"
	pause
	if %x% equ 1 (goto pokemon1first) else (goto pokemon2first)
	pause
) else (
	goto pokemon1first
)

:pokemon1first
if 1 equ 1 (
	set /a "currentHp_pokemon1=%currentHp_pokemon1%-%damageDealt_pokemon2%"
	set /a "currentHp_pokemon2=%currentHp_pokemon2%-%damageDealt_pokemon1%"
	set /a "hit_pokemon1=(!move%selMove_pokemon1%Acc_pokemon1!*(%accRate_pokemon1%/%evaRate_pokemon1%))/100"
	set /a "hit_pokemon2=(!move%selMove_pokemon2%Acc_pokemon2!*(%accRate_pokemon2%/%evaRate_pokemon2%))/100"
	if !currentHp_pokemon1! lss 0 set currentHp_pokemon1=0
	if !currentHp_pokemon2! lss 0 set currentHp_pokemon2=0
	cls
	echo(
	echo   %name_pokemon2%
	echo  ________________
	echo / HP: !currentHp_pokemon2!/%hp_pokemon2%
	type                                                                         assets\sprites\%species_pokemon2%_frontSprite.txt
	echo(
	echo(
	echo(
	echo(
	echo(
	type assets\sprites\%species_pokemon1%_backSprite.txt
	echo(
	echo                      %nknm_pokemon1%
	echo                     ________________
	echo                    / HP: %currentHp_pokemon1%/%hp_pokemon1%
	echo %nknm_pokemon1% used !move%selMove_pokemon1%Name_pokemon1!
	if %crit_pokemon1% equ 1 echo Critical Hit^^!
	set/a "currentPp_move%selMove_pokemon1%_pokemon1=!currentPp_move%selMove_pokemon1%_pokemon2!-1"
	if !currentHp_pokemon2! leq 0 goto fainted_player2
	pause >nul
	cls
	echo(
	echo   %name_pokemon2%
	echo  ________________
	echo / HP: !currentHp_pokemon2!/%hp_pokemon2%
	type                                                                         assets\sprites\%species_pokemon2%_frontSprite.txt
	echo(
	echo(
	echo(
	echo(
	echo(
	type assets\sprites\%species_pokemon1%_backSprite.txt
	echo(
	echo                      %nknm_pokemon1%
	echo                     ________________
	echo                    / HP: !currentHp_pokemon1!/%hp_pokemon1%
	echo %name_pokemon2% used !move%selMove_pokemon2%Name_pokemon2!
	if %crit_pokemon2% equ 1 echo Critical Hit^^!
	set /a "currentPp_move%selMove_pokemon2%_pokemon2=!currentPp_move%selMove_pokemon2%_pokemon2!-1"
	if !currentHp_pokemon1! leq 0 goto fainted_player1
	pause >nul
	goto battleGUI
)
:pokemon2first
if 1 equ 1 (
	set /a "currentHp_pokemon1=%currentHp_pokemon1%-%damageDealt_pokemon2%"
	set /a "currentHp_pokemon2=%currentHp_pokemon2%-%damageDealt_pokemon1%"
	if !currentHp_pokemon1! lss 0 set currentHp_pokemon1=0
	if !currentHp_pokemon2! lss 0 set currentHp_pokemon2=0
	cls
	echo(
	echo   %name_pokemon2%
	echo  ________________
	echo / HP: %currentHp_pokemon2%/%hp_pokemon2%
	type                                                                         assets\sprites\%species_pokemon2%_frontSprite.txt
	echo(
	echo(
	echo(
	echo(
	echo(
	type assets\sprites\%species_pokemon1%_backSprite.txt
	echo(
	echo                      %nknm_pokemon1%
	echo                     ________________
	echo                    / HP: !currentHp_pokemon1!/%hp_pokemon1%
	echo %name_pokemon2% used !move%selMove_pokemon2%Name_pokemon2!
	if %crit_pokemon2% equ 1 echo Critical Hit^^!
	set /a "currentPp_move%selMove_pokemon2%_pokemon2=!currentPp_move%selMove_pokemon2%_pokemon2!-1"
	if !currentHp_pokemon1! leq 0 goto fainted_player1
	pause >nul	
	cls
	echo(
	echo   %name_pokemon2%
	echo  ________________
	echo / HP: !currentHp_pokemon2!/%hp_pokemon2%
	type                                                                         assets\sprites\%species_pokemon2%_frontSprite.txt
	echo(
	echo(
	echo(
	echo(
	echo(
	type assets\sprites\%species_pokemon1%_backSprite.txt
	echo(
	echo                      %nknm_pokemon1%
	echo                     ________________
	echo                    / HP: !currentHp_pokemon1!/%hp_pokemon1%
	echo %nknm_pokemon1% used !move%selMove_pokemon1%Name_pokemon1!
	if %crit_pokemon1% equ 1 echo Critical Hit^^!
	set /a "currentPp_move%selMove_pokemon1%_pokemon1=!currentPp_move%selMove_pokemon1%_pokemon1!-1"
	if !currentHp_pokemon2! leq 0 goto fainted_player2
	pause >nul
	goto battleGUI
)
:fainted_player2
echo %name_pokemon2% Fainted
echo 1,>data\tempFiles\temp_battleResult.txt
pause >nul
goto :eof
:fainted_player1
echo %nknm_pokemon1% Fainted
echo 0,>data\tempFiles\temp_battleResult.txt
pause >nul
goto :eof






