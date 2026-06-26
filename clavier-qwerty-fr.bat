@echo off
chcp 1252 >nul
setlocal EnableDelayedExpansion

rem === Capture du caractere ESC pour les couleurs (degradation silencieuse si echec) ===
for /f %%a in ('echo prompt $E^|cmd') do set "ESC=%%a"
set "C0=!ESC![0m"
set "CC=!ESC![96m"
set "CG=!ESC![92m"
set "CY=!ESC![93m"
set "CR=!ESC![91m"
set "CW=!ESC![97m"
set "CK=!ESC![90m"

rem === Pas d'elevation volontaire : ajouter/retirer un clavier est un reglage PAR UTILISATEUR. ===
rem === Lancer NON-admin garantit que le changement touche bien ta session ouverte.            ===

:menu
cls
echo.
echo   !CC!=====================================================!C0!
echo   !CC!    CLAVIER QWERTY (US) / AZERTY (FR) - pour le jeu  !C0!
echo   !CC!=====================================================!C0!
echo.
echo   !CW!Claviers installes en ce moment :!C0!
for /f "delims=" %%k in ('powershell -NoProfile -Command "(Get-WinUserLanguageList).LanguageTag"') do echo       !CG!%%k!C0!
echo.
echo   !CW![1]!C0! Ajouter le clavier anglais !CW!QWERTY (US)!C0! en plus du francais
echo   !CW![2]!C0! Revenir au !CW!francais seul!C0! + masquer l'icone clavier de la barre
echo   !CW![3]!C0! Quitter
echo.
choice /c 123 /n /m "   Choix : "
if errorlevel 3 goto end
if errorlevel 2 goto revert
if errorlevel 1 goto add

:add
echo.
echo   !CY!Ajout du clavier anglais QWERTY (US)...!C0!
powershell -NoProfile -ExecutionPolicy Bypass -Command "$l=Get-WinUserLanguageList; if(-not($l|Where-Object{$_.LanguageTag-eq'en-US'})){$l.Add('en-US'); Set-WinUserLanguageList $l -Force}" >nul 2>&1
echo   !CG![OK]!C0! Clavier anglais QWERTY ajoute (le francais AZERTY reste par defaut).
echo   !CK!        Bascule FR / EN a la volee avec  !CW!Win + Espace!CK!  (ou Alt-gauche + Maj).!C0!
echo.
pause
goto menu

:revert
echo.
echo   !CY!Retour au francais seul + masquage de l'icone clavier...!C0!
powershell -NoProfile -ExecutionPolicy Bypass -Command "$l=@(Get-WinUserLanguageList|Where-Object{$_.LanguageTag-notlike'en*'}); if($l.Count -ge 1){Set-WinUserLanguageList -LanguageList $l -Force}" >nul 2>&1
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v ShowStatus /t REG_DWORD /d 3 /f >nul 2>&1
echo   !CG![OK]!C0! Francais seul. Le clavier anglais QWERTY a ete retire.
echo   !CK!        Avec un seul clavier, l'icone de langue disparait de la barre.!C0!
echo   !CK!        A appliquer apres une fermeture/reouverture de session (ou un reboot).!C0!
echo.
pause
goto menu

:end
endlocal
exit /b
