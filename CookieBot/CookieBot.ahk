#MaxThreadsPerHotkey 3
!p::               
#MaxThreadsPerHotkey 1

if KeepCtrljRunning  
{
   KeepCtrljRunning := false
   return
}
KeepCtrljRunning := true

LoopVariable := 5               ;; Amount of loops before the next upgrade is forced
TimerVariable := 300            ;; Duration of one loop, in seconds

IniRead, ClickTimer, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Timers, ClickTimer
IniRead, LoopsSinceUpgrade, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Timers, LoopsSinceUpgrade

IniRead, CursorCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, CursorCount
IniRead, GrandmaCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, GrandmaCount

IniRead, FarmCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, FarmCount
IniRead, MineCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, MineCount
IniRead, FactoryCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, FactoryCount
IniRead, BankCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, BankCount
IniRead, TempleCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, TempleCount
IniRead, WizardTowerCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, WizardTowerCount
IniRead, ShipmentCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, ShipmentCount
IniRead, AlchemyLabCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, AlchemyLabCount
IniRead, PortalCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, PortalCount
IniRead, TimeMachineCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, TimeMachineCount
IniRead, AntiCondenserCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, AntiCondenserCount
IniRead, PrismCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, PrismCount
IniRead, AChanceMakerCount, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, ChanceMakerCount


AutoClick:
   Loop
   {  
      PixelGetColor, FirstUpgrade, 2358, 176
      ImageSearch, GoldX, GoldY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\GoldenCookie.png
      ImageSearch, WrathX, WrathY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\WrathCookie.png
      if not KeepCtrljRunning                      ;; break early if the hotkey is pressed
         {
            Goto, SaveCounts
         }
      Else If GoldX > 0                            ;; Searches the screen for golden cookies every second
         {
            Click %GoldX%, %GoldY%
         }
      Else If WrathX > 0                            ;; Searches the screen for golden cookies every second
         {
            Click %WrathX%, %WrathY%
         }
      Else if ClickTimer > %TimerVariable%          ; Defined up top
         {
            ClickTimer := 0 
            Goto, UpgradeStatus
         }     
      Else 
         {
            Click 393, 646, 30                     ;; One second of clicks
            ClickTimer := (ClickTimer+1)
         }
   }
KeepCtrljRunning := false  ; Reset in preparation for the next press of this hotkey.
return


SaveCounts:
IniWrite, %ClickTimer%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Timers, ClickTimer
IniWrite, %LoopsSinceUpgrade%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Timers, LoopsSinceUpgrade

IniWrite, %CursorCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, CursorCount
IniWrite, %GrandmaCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, GrandmaCount
IniWrite, %FarmCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, FarmCount
IniWrite, %MineCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, MineCount
IniWrite, %FactoryCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, FactoryCount
IniWrite, %BankCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, BankCount
IniWrite, %TempleCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, TempleCount
IniWrite, %WizardTowerCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, WizardTowerCount
IniWrite, %ShipmentCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, ShipmentCount
IniWrite, %AlchemyLabCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, AlchemyLabCount
IniWrite, %PortalCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, PortalCount
IniWrite, %TimeMachineCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, TimeMachineCount
IniWrite, %AntiCondenserCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, AntiCondenserCount
IniWrite, %PrismCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, PrismCount
IniWrite, %AChanceMakerCount%, C:\Users\JoeKM\AHK_Scripts\CookieBot\Upgrades.ini, Upgrades, ChanceMakerCount
Return

UpgradeStatus:
PixelGetColor, UpgradeStatusTop, 2455, 169   
PixelGetColor, UpgradeStatusMid, 2455, 219
PixelGetColor, UpgradeStatusMid2, 2455, 269 
PixelGetColor, UpgradeStatusBot, 2455, 320
If (UpgradeStatusTop = 0x6E93BB And UpgradeStatusMid = 0x6E93BB And UpgradeStatusMid2 = 0x6C8DB7 And UpgradeStatusBot = 0x6C8DB7)  ;; 3 rows     
   {
      FirstUpgradeX := 2358                                                                                      
      FirstUpgradeY := 277
      FirstUpgradeColour := "0x89B3D6"
      Goto, ResearchUpgrades
   }
Else if (UpgradeStatusTop = 0x6E93BB And UpgradeStatusMid = 0x6E93BB And UpgradeStatusMid2 = 0x6C8DB7) ;; 2 rows
   {
      FirstUpgradeX := 2358                                                                                      
      FirstUpgradeY := 225
      FirstUpgradeColour := "0x8EB7D9"
      Goto, FirstUpgrade
   }
Else ;; one row - don't think this is ever relevant after 1st ascension
   {
      FirstUpgradeX := 2358
      FirstUpgradeY := 320
      FirstUpgradeColour := "0x89B3D6"
      Goto, FirstUpgrade
   }


ResearchUpgrades:
PixelGetColor, ResearchUpgrade, 2358, 225
If ResearchUpgrade = 0x8EB7D9
   {
      ImageSearch, OneMindX, OneMindY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\OneMind.png
      If OneMindX > 0
         {
            click 2358, 225
            Sleep 10 
            click 1272, 813
            Goto, FirstUpgrade
         }
      Else
         {
            click 2358, 225
            Goto, FirstUpgrade
         }
   }   
Else Goto, FirstUpgrade  


FirstUpgrade:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      PixelGetColor, FirstUpgrade, %FirstUpgradeX%, %FirstUpgradeY% 
      If FirstUpgrade = %FirstUpgradeColour%  
         {
            Click %FirstUpgradeX%, %FirstUpgradeY%
            UpgradeBoughtThisLoop := 1
         }
      Else                   
         {
            If UpgradeBoughtThisLoop = 1                               ;; If an upgrade was bought this loop reset the counters and move on 
               {
                UpgradeBoughtThisLoop := 0                   
                LoopsSinceUpgrade := 0
                Goto, Idleverse
               }
            Else
               {
                  LoopsSinceUpgrade := (LoopsSinceUpgrade+1)           ;; Counts loops since upgrade
                  If LoopsSinceUpgrade > %LoopVariable%                ;; Defined up top     
                     {
                        Goto, AutoClick
                     }
                  Else Goto, Idleverse                         ;; no upgrade this loop, but less than 5 loops, continue buy cycle
               }
         }
   }

Idleverse:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, IdleverseX, IdleverseY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Idleverse.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If IdleverseX > 0
         {
           Click %IdleverseX%, %IdleverseY%
           IdleverseCount := (IdleverseCount+1)
         }
      Else Goto, JavaScriptConsole
   }   

JavaScriptConsole:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, JavaScriptConsoleX, JavaScriptConsoleY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\JavaScriptConsole.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If JavaScriptConsoleX > 0
         {
           Click %JavaScriptConsoleX%, %JavaScriptConsoleY%
           JavaScriptConsoleCount := (JavaScriptConsoleCount+1)
         }
      Else Goto, FractalEngine
   }

FractalEngine:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, FractalEngineX, FractalEngineY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\FractalEngine.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If FractalEngineX > 0
         {
           Click %FractalEngineX%, %FractalEngineY%
           FractalEngineCount := (FractalEngineCount+1)
         }
      Else Goto, ChanceMaker
   }

ChanceMaker:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, ChanceMakerX, ChanceMakerY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\ChanceMaker.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If ChanceMakerX > 0
         {
           Click %ChanceMakerX%, %ChanceMakerY%
           ChanceMakerCount := (ChanceMakerCount+1)
         }
      Else Goto, Prism
   }

Prism:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, PrismX, PrismY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Prism.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If PrismX > 0
         {
           Click %PrismX%, %PrismY%
           PrismCount := (PrismCount+1)
         }
      Else Goto, AntiCondenser
   }

AntiCondenser:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, AntiCondenserX, AntiCondenserY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\AntiCondenser.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If AntiCondenserX > 0
         {
           Click %AntiCondenserX%, %AntiCondenserY%
           AntiCondenserCount := (AntiCondenserCount+1)
         }
      Else Goto, TimeMachine
   }

TimeMachine:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, TimeMachineX, TimeMachineY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\TimeMachine.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If TimeMachineX > 0
         {
           Click %TimeMachineX%, %TimeMachineY%
           TimeMachineCount := (TimeMachineCount+1)
         }
      Else Goto, Portal
   }

Portal:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, PortalX, PortalY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Portal.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If PortalX > 0
         {
           Click %PortalX%, %PortalY%
           PoralCount := (PoralCount+1)
         }
      Else Goto, AlchemyLab
   }

AlchemyLab:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, AlchemyLabX, AlchemyLabY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\AlchemyLab.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If AlchemyLabX > 0
         {
           Click %AlchemyLabX%, %AlchemyLabY%
           AlchemyLabCount := (AlchemyLabCount+1)
         }
      Else Goto, Shipment
   }

Shipment:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, ShipmentX, ShipmentY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Shipment.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If ShipmentX > 0
         {
           Click %ShipmentX%, %ShipmentY%
           ShipmentCount := (ShipmentCount+1)
         }
      Else Goto, WizardTower
   }

WizardTower:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, WizardTowerX, WizardTowerY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\WizardTower.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If WizardTowerX > 0
         {
           Click %WizardTowerX%, %WizardTowerY%
           WizardTowerCount := (WizardTowerCount+1)
         }
      Else Goto, Temple
   }

Temple:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, TempleX, TempleY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Temple.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If TempleX > 0
         {
           Click %TempleX%, %TempleY%
           TempleCount := (TempleCount+1)
         }
      Else Goto, Bank
   }

Bank:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, BankX, BankY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Bank.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If BankX > 0
         {
           Click %BankX%, %BankY%
           BankCount := (BankCount+1)
         }
      Else Goto, Factory
   }

Factory:
Loop 
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, FactoryX, FactoryY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Factory.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If FactoryX > 0
         {
           Click %FactoryX%, %FactoryY%
           FactoryCount := (FactoryCount+1)
         }
      Else Goto, Mine
   }

Mine:
Loop
   {
      Click 2347, 507 , 0
      ImageSearch, MineX, MineY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Mine.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If MineX > 0
         {
           Click %MineX%, %MineY%
           MineCount := (MineCount+1)
         }
      Else Goto, Farm
   }

Farm:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, FarmX, FarmY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Farm.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If FarmX > 0
         {
           Click %FarmX%, %FarmY%
           FarmCount := (FarmCount+1)
         }
      Else Goto, Grandma
   }

Grandma:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10 
      ImageSearch, GrandmaX, GrandmaY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Grandma1.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If GrandmaX > 0
         {
           Click %GrandmaX%, %GrandmaY%
           GrandmaCount := (GrandmaCount+1)
         }
      Else Goto, Cursor
   }

Cursor:
Loop
   {
      Click 2347, 507, 0 
      Sleep 10
      ImageSearch, CursorX, CursorY, 2346, 216, 2463, 1395, C:\Users\JoeKM\AHK_Scripts\CookieBot\ImageLibary\Cursor.png
      If not KeepCtrljRunning                      
         {
            Goto, SaveCounts
         }
      Else If CursorX > 0
         {
           Click %CursorX%, %CursorY%
           CursorCount := (CursorCount+1)
         }
      Else Goto, AutoClick
   }