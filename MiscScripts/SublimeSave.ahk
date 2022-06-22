!s::

SetTitleMatchMode, 2
If WinActive("Sublime Tex")
	{
		Send ^s
		Sleep 10
		Send +^p
		Sleep 10
		Send AutoHotKey - Run
		Send {Enter}
		sleep 100
		IfWinExist, ahk_exe AutoHotkeyU32.exe
			{
				Send {Enter}
			}
	}
Else MsgBox Script only works in SublimeText
