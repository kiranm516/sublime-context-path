@Echo OFF
TITLE Sublime Text 3 - Add context menu entry

REM Path for sublime_text.exe. Change it if you have installed it at different location
SET "SublimeExe=C:\Program Files\Sublime Text 3\sublime_text.exe"

IF EXIST "%SublimeExe%" (
	REM Add for all files
	REG ADD "HKEY_CLASSES_ROOT\*\shell\Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
	REG ADD "HKEY_CLASSES_ROOT\*\shell\Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%SublimeExe%,0" /f
	REG ADD "HKEY_CLASSES_ROOT\*\shell\Sublime Text 3\command" /t REG_SZ /v "" /d "%SublimeExe% \"%%1\"" /f

	REM Add for directory/folder background on right clicking in the current directory
	REG ADD "HKEY_CLASSES_ROOT\directory\background\shell\Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
	REG ADD "HKEY_CLASSES_ROOT\directory\background\shell\Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%SublimeExe%,0" /f
	REG ADD "HKEY_CLASSES_ROOT\directory\background\shell\Sublime Text 3\command" /t REG_SZ /v "" /d "%SublimeExe% \"%%V\"" /f

	REM Add for directory/folder shell (on right clicking directory)
	REG ADD "HKEY_CLASSES_ROOT\directory\shell\Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
	REG ADD "HKEY_CLASSES_ROOT\directory\shell\Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%SublimeExe%,0" /f
	REG ADD "HKEY_CLASSES_ROOT\directory\shell\Sublime Text 3\command" /t REG_SZ /v "" /d "%SublimeExe% \"%%1\"" /f

	Echo.
	Echo ----------------------------------
	Echo Added Sublime Text to Context Path
	Echo              Enjoy
	Echo ----------------------------------
	Echo.
) ELSE (
	Echo.
	Echo ---------------------------------------
	Echo Cannot add Sublime Text to Context Path
	Echo   as sublime_text.exe doesn't exit at
	Echo %SublimeExe%
	Echo                 :-(
	Echo Check and edit the variable SublimeExe
	Echo           in this batch file
	Echo ---------------------------------------
	Echo.
)


PAUSE