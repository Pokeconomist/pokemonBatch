@echo off
rem =======================================================================================================
rem Measuring programming progress by lines of code is like measuring aircraft building progress by weight.
rem --
rem Bill Gates
rem =======================================================================================================
setLocal EnableDelayedExpansion
rem call data\readme.bat

rem startup code
:start
echo New game (1)
if exist data\saveLog.txt echo Continue (2)
set /p start=":" || set start=0
if %start% equ 1 (
	goto newGame
) else (
	if %start% equ 2 (
		if exist data\saveLog.txt (
			goto loadSave
		) else (
			goto start
		)
	) else (
		goto start
	)
)

rem save loading, obtain data from save log
:loadSave
for /f "tokens=1 delims=," %%A in (data\saveLog.txt) do (set player=%%A) || goto missing_saveFile
if [%player%]==[] goto missing_saveFile
for /f "tokens=2 delims=," %%A in (data\saveLog.txt) do (set rival=%%A) || goto missing_saveFile
if [%rival%]==[] goto missing_saveFile
for /f "tokens=3 delims=," %%A in (data\saveLog.txt) do (set goto=%%A) || goto missing_saveFile
if [%goto%]==[] goto missing_saveFile
for /f "tokens=3 delims=," %%A in (data\saveLog.txt) do (set check_starterPokemon=%%A) || goto missing_saveFile
if "%check_starterPokemon%"==[] goto missing_saveFile
for /f "tokens=3 delims=," %%A in (data\saveLog.txt) do (set checkPokemon=%%A) || goto missing_saveFile
if [%checkPokemon%]==[] goto missing_saveFile
goto %goto%

:missing_saveFile
cls
echo Save file missing or corrupted.
del /q data\saveLog.txt
pause >nul

:saveGame
color 07
if exist data\saveLog.txt del /q data\saveLog.txt
cls
echo Saving game 
echo Do not turn of the power
timeout 1 >nul
cls
echo Saving game .
echo Do not turn of the power
timeout 1 >nul
cls
echo Saving game ..
echo Do not turn of the power
timeout 1 >nul
cls
echo Saving game ...
echo Do not turn of the power
timeout 1 >nul
cls
echo Saving game .
echo Do not turn of the power
timeout 1 >nul
cls
echo Saving game ..
echo Do not turn of the power
timeout 1 >nul
echo %player%,%rival%,%goto%,%check_starterPokemon%,%checkPokemon%>data\saveLog.txt
cls
echo Game Saved
timeout 1 >nul
goto %goto%

:newGame
rem empty variables
set "move="
set /a "check_starterPokemon=0"
set /a "checkPokemon=0"
set "answer="
set "goto="

cls
echo Hello there^^! Welcome to the world of POK?MON^^!
echo My name is Oak^^! People call me the POK信ON PROF^^!
pause >nul
echo This world is inhabited by creatures called POK信ON^^!
echo For some people, POK信ON are pets. Other use them for fights.
echo Myself... I study POK信ON as a profession.
pause >nul
echo First, what is your name?
set /p player=":" || Set player=GREEN
echo Right^^! So your name is %player%^^!
pause >nul
echo This is my grandson. He's been your rival since you were a baby.
echo ...Erm, what is his name again?
set /p rival=":" || Set rival=BLUE
echo That's right^^! I remember now^^! His name is %rival%^^!
pause >nul
cls
echo %player%^^! Your very own POK信ON legend is about to unfold^^!
echo A world of dreams and adventures with POK信ON awaits^^! Let's go^^!
pause >nul
goto 2F_playerHouse

rem NEW LOCATION

:2F_playerHouse
color 09
set goto=2F_playerHouse
cls
type assets\maps\playerHouse.txt
echo(
echo     %player%'s House 2F
echo(
echo OPTIONS
echo i. Go downstairs (1)
echo ii. Play the SNES (2)
echo iii. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	goto 1F_playerHouse
) else (
	if %move% equ 2 (
		goto playSNES_2F_playerHouse
	) else (
		if /i %move% == x (
			goto saveGame
		) else (
			goto 2F_playerHouse
		)
	)
)

:playSNES_2F_playerHouse
echo %player% is playing the SNES^^! 
echo ...Okay^^! It's time to go^^!
pause >nul
goto 2F_playerHouse

rem NEW LOCATION

:1F_playerHouse
color 09
set goto=1F_playerHouse
cls
type assets\maps\playerHouse.txt
echo(
echo    %player%'s House 1F
echo(
echo MOM: Right. All boys leave home someday. It said so on TV.
echo Prof.Oak, next door, is looking for you.
pause >nul
echo OPTIONS
echo i. Go upstairs (1)
echo ii. Go outside (2)
echo iii. Watch TV (3)
echo iv. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	goto 2F_playerHouse
) else (
	if %move% equ 2 (
		goto palletTown
	) else (
		if %move% equ 3 (
			goto tv_1F_playerHouse
		) else (
			if /i %move% == x (
				goto saveGame
			) else (
				goto 1F_playerHouse
			)
		)
	)
 )

:tv_1F_playerHouse
echo There's a movie on TV.
echo Four boys are walking on railroad tracks.
echo I better go too.
pause >nul
goto :1F_playerHouse

rem NEW LOCATION

:palletTown
color 0d
set goto=palletTown
cls
echo(
echo                                 Route 1
type assets\maps\palletTown1.txt
echo(
echo              %player%'s House                    %rival%'s House
echo(
type assets\maps\palletTown2.txt
echo(
echo                                           Professor Oak's Lab
echo(
echo                         Pallet Town
echo                 Shades of your journey await^^!
echo(
echo OPTIONS
echo i. Go home (1)
echo ii. Go to Route 1 (2)
echo iii. Go to %rival%'s House (3)
echo iv. Go to Professor Oak's Laboratory (4)
echo v. Talk to Girl (5)
echo vi. Talk to Hiker (6)
echo vii. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	goto 1F_playerHouse
) else (
	if %move% equ 2 (
		goto 1_route1
	) else (
		if %move% equ 3 (
			goto 1F_rivalHouse
		) else (
			if %move% equ 4 (
				goto oakLab
			) else (
				if %move% equ 5 (
					goto girl_palletTown
				) else (
					if %move% equ 6 (
						goto hiker_palletTown
					) else (
						if /i %move% == x (
							goto saveGame
						) else (
							goto palletTown
						)
					)
				)
			)
		)
	)
)

:girl_palletTown
color 0d
echo GIRL: I'm raising POK信ON too^^! When they get strong, they can protect me^^!
pause >nul
goto palletTown

:hiker_palletTown
color 0d
echo HIKER: Technology is incredible^^!
echo You can now store and recall items and POK信ON as data via PC^^!
pause >nul
goto palletTown

rem NEW LOCATION

:1F_rivalHouse
color 09
set goto=1F_rivalHouse
cls
type assets\maps\playerHouse.txt
echo(
echo    %rival%'s House 1F
echo(
rem (LATER) if %checkPokemon% equ 0 goto daisyOak_noDex
rem         :daisyOakNoDex
echo %rival%'s Sis: Hi %player%^^! %Rival% is out at Grandpa's lab
pause >nul
echo OPTIONS
echo i. Go upstairs (1)
echo ii. Go outside (2)
echo iii. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	goto 2F_rivalHouse
) else (
	if %move% equ 2 (
		goto palletTown
	) else (
		if /i %move% == x (
			goto saveGame
		) else (
			goto 1F_rivalHouse
		)
	)
)

rem NEW LOCATION

:2F_rivalHouse
color 09
set goto=2F_rivalHouse
cls
type assets\maps\playerHouse.txt
echo(
echo    %rival%'s House 1F
echo(
echo OPTIONS
echo i. Go downstairs (1)
echo ii. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	goto palletTown
) else (
	if /i %move% == x (
		goto saveGame
	) else (
		goto 2F_rivalHouse
	)
)

rem NEW LOCATION

:oakLab
color 0a
set goto=oakLab
cls
type assets\maps\oakLab.txt
echo(
echo    Oak POK信ON Research Lab
echo(
if %check_starterPokemon% equ 1 (
	goto a_oakLab
) else (
	if '%check_starterPokemon%==' (
		goto prePokedex_oakLab
	) else (
		goto prePokedex_oakLab
	)
)
:prePokedex_oakLab
color 0a
echo OPTIONS
echo i. Go outside (1)
echo ii. Talk to %rival% (2)
echo ii. Talk to Aide (3)
echo iv. Turn on computer (4)
echo v. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	goto palletTown
) else (
	if %move% equ 2 (
		echo %rival%: Yo %player%^^! Gramps isn't around^^!
		echo I ran here 'cos he said he had a POK信ON for me.
		pause >nul
		goto :oakLab
	) else (
		if %move% equ 3 (
			echo I study POK信ON as PROF.OAK'S AIDE.
			pause >nul
			goto oakLab
		) else (
			if %move% equ 4 (
				echo There's an e-mail message here^^!
				echo ... Calling all POK信ON trainers^^!
				echo The elite trainers of POK信ON LEAGUE are ready to take on all comers^^!
				echo Bring your best POK信ON and see how you rate as a trainer^^!
				echo(
				echo            POK信ON LEAGUE HQ INDIGO PLATEAU
				echo            PS: PROF.OAK, please visit us^^! ...
				pause >nul
				goto oakLab
			) else (
				if /i %move% == x (
					goto saveGame
				) else (
					goto oakLab
				)
			)
		)
	)
)
:a_oakLab
color 0a
echo %rival%: Gramps^^! I'm fed up with waiting^^!
pause >nul
echo OAK: %rival%? Let me think... Oh, that's right. I told you to come^^!
echo Just wait^^!
pause >nul
echo OAK: Here, %player%^^! There are 3 POK信ON here^^! Haha^^! They are inside the POKE BALLS.
echo When I was young, I was a serious POK信ON trainer^^!
echo In my old age, I have only 3 left, but you can have one^^!
echo Choose^^!
pause >nul
echo %rival%: Hey^^! Gramps^^! What about me^?
echo OAK: Be patient^^! %rival%, you can have one too^^!
pause >nul
cls
type assets\maps\oakLab.txt
echo(
echo    Oak POK信ON Research Lab
echo(
echo OAK: Now, %player%, which POK信ON do you want^?
pause >nul
echo %rival%: Heh, I don't need to be greedy like you^^! Go ahead and choose, %player%^^!
pause >nul
cls
type assets\maps\oakLab.txt
echo(
echo    Oak POK信ON Research Lab
echo(
:bulbasaur_starterPokemon
echo ===========================
echo          BULBASAUR
echo ===========================
echo OAK: So! You want the plant POK信ON, BULBASAUR? (Y/N)
set 'answer='
set /p answer=":"  || set answer=0
if /i %answer%==y (
	set dex_pokemon1=1
	set move1_pokemon1=112
	set move2_pokemon1=53
	goto recieve_starterPokemon
) else (
	if /i %answer%==n (
		goto charmander_starterPokemon
	) else (
		goto bulbasaur_starterPokemon
	)
)
:charmander_starterPokemon
echo ===========================
echo          CHARMANDER
echo ===========================
echo OAK: So! You want the fire POK信ON, CHARMANDER?(Y/N)
set 'answer='
set /p answer=":"  || set answer=0
if /i %answer%==Y (
	set dex_pokemon1=7
	set move1_pokemon1=144
	set move2_pokemon1=145
	goto recieve_starterPokemon
) else (
	if /i %answer%==n (
		goto squirtle_starterPokemon
	) else (
		goto charmander_starterPokemon
	)
)
:squirtle_starterPokemon
echo ===========================
echo          SQUIRTLE
echo ===========================
echo OAK: So! You want the water POK信ON, SQUIRTLE? (Y/N)
set 'answer='
set /p answer=":"  || set answer=0
if /i %answer%==Y (
	set dex_pokemon1=1
	set move1_pokemon1=112
	set move2_pokemon1=53
	goto recieve_starterPokemon
) else (
	if /i %answer%==n (
		goto bulbasaur_starterPokemon
	) else (
		goto squirtle_starterPokemon
	)
)
:pre_rivalBattle_oakLab
set goto=pre_rivalBattle_oakLab
color 0a
cls
type assets\maps\oakLab.txt
echo(
echo    Oak POK信ON Research Lab
echo(
echo OPTIONS
echo i. Talk to OAK (1)
echo ii. Talk to %rival% (2)
echo iii. Go Outside (3)
echo iv. Turn on computer (4)
echo v. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	echo OAK: If a wild POK信ON appears, your POK信ON can fight against it^^!
	pause >nul
	goto pre_rivalBattle_oakLab
) else (
	if %move% equ 2 (
		echo %rival%: My POK信ON looks a lot stronger.
		pause >nul
		goto pre_rivalBattle_oakLab
	) else (
		if %move% equ 3 (
			echo %rival%: Wait %player%^^! Let's check out our POK信ON^^! Come on, I'll take you on^^!
			pause >nul
			goto rivalBattle_oakLab
		) else (
			if %move% equ 4 (
				echo There's an e-mail message here^^!
				echo ... Calling all POK信ON trainers^^!
				echo The elite trainers of POK信ON LEAGUE are ready to take on all comers^^!
				echo Bring your best POK信ON and see how you rate as a trainer^^!
				echo(
				echo            POK信ON LEAGUE HQ INDIGO PLATEAU
				echo            PS: PROF.OAK, please visit us^^! ...
				pause >nul
				goto pre_rivalBattle_oakLab
			) else (
				if /i %move% == x (
					goto saveGame
				) else (
					goto pre_rivalBattle_oakLab
				)
			)
		)
	)
)
:rivalBattle_oakLab
call programs\trainer_batSim.bat data\tempFiles\temp_player_pokemonStats.txt data\tempFiles\temp_rival_pokemonStats.txt
pause
for /f "tokens=1 delims=," %%A in (data\tempFiles\temp_battleResult.txt) do (set battleResult=%%A)
del /q data\tempFiles\temp_battleResult.txt
if %battleResult% equ 1 (
	echo %rival%: WHAT? Unbelievable^^! I picked the wrong POK信ON^^!
	pause >nul
	echo Okay! I'll make my POK信ON fight to toughen it up^^!
	echo %player%^^! Gramps^^! Smell you later^^!
	pause >nul
	goto post_rivalBattle_oakLab
) else (
	echo %rival%: Yeah! Am I great or what?
	pause >nul
	echo Okay! I'll make my POK信ON fight to toughen it up^^!
	echo %player%^^! Gramps^^! Smell you later^^!
	pause >nul
	goto post_rivalBattle_oakLab
)
:post_rivalBattle_oakLab
set goto=post_rivalBattle_oakLab
color 0a
cls
type assets\maps\oakLab.txt
echo(
echo    Oak POK信ON Research Lab
echo(
echo OPTIONS
echo i. Talk to OAK (1)
echo iii. Go Outside (2)
echo iv. Turn on computer (3)
echo v. SAVE (x)
set "move="
set /p move=":" || set move=0
if %move% equ 1 (
	echo OAK: %Player%, raise your young POK信ON by making it fight^^!
	pause >nul
	goto post_rivalBattle_oakLab
) else (
	if %move% equ 2 (
		goto post_rivalBattle_palletTown
	) else (
		if %move% equ 3 (
			echo There's an e-mail message here^^!
			echo ... Calling all POK信ON trainers^^!
			echo The elite trainers of POK信ON LEAGUE are ready to take on all comers^^!
			echo Bring your best POK信ON and see how you rate as a trainer^^!
			echo(
			echo            POK信ON LEAGUE HQ INDIGO PLATEAU
			echo            PS: PROF.OAK, please visit us^^! ...
			pause >nul
			goto pre_rivalBattle_oakLab
		) else (
			if /i %move% == x (
				goto saveGame
			) else (
				goto post_rivalBattle_oakLab
			)
		)
	)
)

:1_route1
color 0a
set goto=1_route1
cls
type assets\maps\route1.txt
echo(
echo                       Route 1
echo(
if %checkPokemon% equ 0 (
	goto getPokemon_route1
) else (
	goto post1_route1
)
:post1_route1
echo route 1 you have a pokemon
echo now go home
pause >nul
goto palletTown
:getPokemon_route1
echo OAK: Hey^^!
echo Wait^^!
echo Don't go out^^!
pause > nul
echo It's unsafe^^! Wild POK信ON live in tall grass^^!
echo You need your own POK信ON for your protection.
echo I know^^! Here, come with me^^!
pause >nul
set check_starterPokemon=1
goto :oakLab

:1a_route1
echo OPTIONS
pause >nul
goto palletTown


:recieve_starterPokemon
echo Do you want to give %name_pokemon1% a nickname? (Y,N)
set "answer="
set /p answer=":"  || set answer=0
if /i %answer%==y (
	set /p nknm_pokemon1=":" || rem An induced current flows in the direction that creates a magnetic field that opposes the direction of the external change in magnetic field.
) else (
	set nknm_pokemon1=%name_pokemon1%
)

set checkPokemon=1
set /a "lvl_pokemon1=5"
set /a "rival_lvl_pokemon1=5"
cls
type assets\maps\oakLab.txt
echo(
echo    Oak POK信ON Research Lab
echo(
echo OAK: This POK信ON is really energetic^^!
echo %rival%: I'll take this one, then^^!
pause
if %dex_pokemon1% equ 1 (
	set rival_dex_pokemon1=4
	set rival_move1_pokemon1=112
	set rival_move2_pokemon1=53
)
if %dex_pokemon1% equ 4 (
	set rival_dex_pokemon1=7
	set rival_move1_pokemon1=144
	set rival_move2_pokemon1=145
)
if %dex_pokemon1% equ 7 (
	set rival_dex_pokemon1=1
	set rival_move1_pokemon1=112
	set rival_move2_pokemon1=53
)

REM FIX THIS SO THAT ONLY THE IVS A SAVED AND STATS ARE CALCULATED BASED ON LEVEL
REM ==========================================================++++++++++++++++++

call programs\pokemon_dataExtractor.bat %dex_pokemon1%
for /f "tokens=1 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set name_pokemon1=%%A)
for /f "tokens=2 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set hp_base_pokemon1=%%A)
for /f "tokens=3 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set atk_base_pokemon1=%%A)
for /f "tokens=4 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set def_base_pokemon1=%%A)
for /f "tokens=5 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set spd_base_pokemon1=%%A)
for /f "tokens=6 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set spc_base_pokemon1=%%A)
del /q data\tempFiles\temp_stats.txt

set /a "hp_iv_pokemon1=(%random%)%%32"
set /a "atk_iv_pokemon1=(%random%)%%32"
set /a "def_iv_pokemon1=(%random%)%%32"
set /a "spd_iv_pokemon1=(%random%)%%32"
set /a "spc_iv_pokemon1=(%random%)%%32"
set /a "hp_pokemon1=((((hp_base_pokemon1+hp_iv_pokemon1)*2)*lvl_pokemon1)/100)+lvl_pokemon1+10"
set /a "atk_pokemon1=((((atk_base_pokemon1+hp_iv_pokemon1)*2)*lvl_pokemon1)/100)+5"
set /a "def_pokemon1=((((def_base_pokemon1+hp_iv_pokemon1)*2)*lvl_pokemon1)/100)+5"
set /a "spd_pokemon1=((((spd_base_pokemon1+hp_iv_pokemon1)*2)*lvl_pokemon1)/100)+5"
set /a "spc_pokemon1=((((spc_base_pokemon1+hp_iv_pokemon1)*2)*lvl_pokemon1)/100)+5"

echo %name_pokemon1%,%nknm_pokemon1%,%hp_pokemon1%,%atk_pokemon1%,%def_pokemon1%,%spd_pokemon1%,%spc_pokemon1%,%lvl_pokemon1%,%dex_pokemon1%,%move1_pokemon1%,%move2_pokemon1%>data\tempFiles\temp_player_pokemonStats.txt

call programs\pokemon_dataExtractor.bat %rival_dex_pokemon1%
for /f "tokens=1 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set rival_name_pokemon1=%%A)
for /f "tokens=2 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set rival_hp_base_pokemon1=%%A)
for /f "tokens=3 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set rival_atk_base_pokemon1=%%A)
for /f "tokens=4 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set rival_def_base_pokemon1=%%A)
for /f "tokens=5 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set rival_spd_base_pokemon1=%%A)
for /f "tokens=6 delims=," %%A in (data\tempFiles\temp_stats.txt) do (set rival_spc_base_pokemon1=%%A)
del /q data\tempFiles\temp_stats.txt

set /a "rival_hp_iv_pokemon1=(%random%)%%32"
set /a "rival_atk_iv_pokemon1=(%random%)%%32"
set /a "rival_def_iv_pokemon1=(%random%)%%32"
set /a "rival_spd_iv_pokemon1=(%random%)%%32"
set /a "rival_spc_iv_pokemon1=(%random%)%%32"
set /a "rival_hp_pokemon1=((((rival_hp_base_pokemon1+rival_hp_iv_pokemon1)*2)*rival_lvl_pokemon1)/100)+rival_lvl_pokemon1+10"
set /a "rival_atk_pokemon1=((((rival_atk_base_pokemon1+rival_hp_iv_pokemon1)*2)*rival_lvl_pokemon1)/100)+5"
set /a "rival_def_pokemon1=((((rival_def_base_pokemon1+rival_hp_iv_pokemon1)*2)*rival_lvl_pokemon1)/100)+5"
set /a "rival_spd_pokemon1=((((rival_spd_base_pokemon1+rival_hp_iv_pokemon1)*2)*rival_lvl_pokemon1)/100)+5"
set /a "rival_spc_pokemon1=((((rival_spc_base_pokemon1+rival_hp_iv_pokemon1)*2)*rival_lvl_pokemon1)/100)+5"

echo %rival_name_pokemon1%,%rival_hp_pokemon1%,%rival_atk_pokemon1%,%rival_def_pokemon1%,%rival_spd_pokemon1%,%rival_spc_pokemon1%,%rival_lvl_pokemon1%,%rival_dex_pokemon1%,%rival_move1_pokemon1%,%rival_move2_pokemon1%>data\tempFiles\temp_rival_pokemonStats.txt
goto pre_rivalBattle_oakLab