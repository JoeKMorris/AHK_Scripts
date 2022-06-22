
!a::
Gui, Add, Button, w200 h60 gMain, Main
Gui, Add, Button, w200 h60 gSupport, Support
Gui, Add, Button, w200 h60 gADC, ADC
Gui, Add, Button, w200 h60 gLowRank, Low Rank
Gui, Show,, Print Options

IniRead, MainUser, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, MainUser
IniRead, MainPass, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, MainPass

IniRead, SupportUser, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, SupportUser
IniRead, SupportPass, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, SupportPass

IniRead, ADCUser, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, ADCUser
IniRead, ADCPass, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, ADCPass

IniRead, LowRankUser, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, LowRankUser
IniRead, LowRankPass, C:\Users\JoeKM\AHK_Scripts\LeagueLogin\Credentials.ini, Credentials, LowRankPass

Return


Main:
Gui, Destroy

ClientLoadTimer := 0
FailedLoadFlag := 0

if WinExist("Riot Client Main")   ;; Is the login screen allready open? if yes maximise it.
    {
    	WinActivate 
    }
Else If WinExist("League of Legends")     ;; Are we allready logged in, if yes logout
	{
		WinActivate 20
		WinClose
		sleep 20
		Send {Tab}{enter}
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			
			Else 
				{
					ClientLoadTimer := (ClientLoadTimer+1)
					sleep 20
				}
	}
Else 
	{
		Run, C:\Riot Games\League of Legends\LeagueClient.exe     ;;If none of the above, then open the client.
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			Else 
				{
					sleep 20
					ClientLoadTimer := (ClientLoadTimer+1)
				}
	}
	If FailedLoadFlag = 0
		{
			Sleep 100
			Click 200, 250
			Sleep 20
			Send %MainUser% 
			Sleep 20
			Click 200, 325
			Send %MainPass% 
			Sleep 20
			Send {Enter}
		}
	Else 
		{
			MsgBox Client Failed to load time
			FailedLoadFlag := 0
			ClientLoadTimer := 0
		}

Return











Support:
Gui, Destroy

ClientLoadTimer := 0
FailedLoadFlag := 0

if WinExist("Riot Client Main")   ;; Is the login screen allready open? if yes maximise it.
    {
    	WinActivate 
    }
Else If WinExist("League of Legends")     ;; Are we allready logged in, if yes logout
	{
		WinActivate 20
		WinClose
		sleep 20
		Send {Tab}{enter}
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			
			Else 
				{
					ClientLoadTimer := (ClientLoadTimer+1)
					sleep 20
				}
	}
Else 
	{
		Run, C:\Riot Games\League of Legends\LeagueClient.exe     ;;If none of the above, then open the client.
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			Else 
				{
					sleep 20
					ClientLoadTimer := (ClientLoadTimer+1)
				}
	}
	If FailedLoadFlag = 0
		{
			Sleep 100
			Click 200, 250
			Sleep 20
			Send %SupportUser% 
			Sleep 20
			Click 200, 325
			Send %SupportPass% 
			Sleep 20
			Send {Enter}
		}
	Else 
		{
			MsgBox Client Failed to load time
			FailedLoadFlag := 0
			ClientLoadTimer := 0
		}

Return










ADC:
Gui, Destroy

ClientLoadTimer := 0
FailedLoadFlag := 0

if WinExist("Riot Client Main")   ;; Is the login screen allready open? if yes maximise it.
    {
    	WinActivate 
    }
Else If WinExist("League of Legends")     ;; Are we allready logged in, if yes logout
	{
		WinActivate 20
		WinClose
		sleep 20
		Send {Tab}{enter}
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			
			Else 
				{
					ClientLoadTimer := (ClientLoadTimer+1)
					sleep 20
				}
	}
Else 
	{
		Run, C:\Riot Games\League of Legends\LeagueClient.exe     ;;If none of the above, then open the client.
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			Else 
				{
					sleep 20
					ClientLoadTimer := (ClientLoadTimer+1)
				}
	}
	If FailedLoadFlag = 0
		{
			Sleep 100
			Click 200, 250
			Sleep 20
			Send %ADCUser% 
			Sleep 20
			Click 200, 325
			Send %ADCPass% 
			Sleep 20
			Send {Enter}
		}
	Else 
		{
			MsgBox Client Failed to load time
			FailedLoadFlag := 0
			ClientLoadTimer := 0
		}

Return










LowRank:
Gui, Destroy

ClientLoadTimer := 0
FailedLoadFlag := 0

if WinExist("Riot Client Main")   ;; Is the login screen allready open? if yes maximise it.
    {
    	WinActivate 
    }
Else If WinExist("League of Legends")     ;; Are we allready logged in, if yes logout
	{
		WinActivate 20
		WinClose
		sleep 20
		Send {Tab}{enter}
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			
			Else 
				{
					ClientLoadTimer := (ClientLoadTimer+1)
					sleep 20
				}
	}
Else 
	{
		Run, C:\Riot Games\League of Legends\LeagueClient.exe     ;;If none of the above, then open the client.
		sleep 20
		Loop
			If ClientLoadTimer > 400  ;;If the client takes more than 8 seconds to load, give up
				{
					FailedLoadFlag := 1
					Break
				}
			Else if WinExist("Riot Client Main")      ;;wait for the client to load
				{									
					Break
				}
			Else 
				{
					sleep 20
					ClientLoadTimer := (ClientLoadTimer+1)
				}
	}
	If FailedLoadFlag = 0
		{
			Sleep 100
			Click 200, 250
			Sleep 20
			Send %LowRankUser% 
			Sleep 20
			Click 200, 325
			Send %LowRankPass% 
			Sleep 20
			Send {Enter}
		}
	Else 
		{
			MsgBox Client Failed to load time
			FailedLoadFlag := 0
			ClientLoadTimer := 0
		}

Return



























































































































































