#MaxThreadsPerHotkey 3
!p::               
#MaxThreadsPerHotkey 1

if KeepCtrljRunning  
{
   KeepCtrljRunning := false
   return
}
KeepCtrljRunning := true

LoopsSinceUpgrade := 0
ClickTimer := 0 

IniRead, CursorCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, CursorCount
IniRead, GrandmaCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, GrandmaCount
IniRead, FarmCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, FarmCount
IniRead, MineCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, MineCount
IniRead, FactoryCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, FactoryCount
IniRead, BankCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, BankCount
IniRead, TempleCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, TempleCount
IniRead, WizardTowerCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, WizardTowerCount
IniRead, ShipmentCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, ShipmentCount
IniRead, AlchemyLabCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, AlchemyLabCount
IniRead, PortalCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, PortalCount
IniRead, TimeMachineCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, TimeMachineCount
IniRead, AntiCondenserCount, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, AntiCondenserCount


   AutoClick:
   Loop
   {  
      PixelGetColor, FirstUpgrade, 2358, 176
      ImageSearch, GoldX, GoldY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\GoldenCookie.png
      if not KeepCtrljRunning                      ;; break early if the hotkey is pressed
         {
            ClickTimer := 0 
            Goto, SaveCounts
         }
      Else If GoldX > 0                            ;; Searches the screen for golden cookies every second
         {
            Click %GoldX%, %GoldY%
         }
      Else if ClickTimer > 300                     ;; Every 5 mins start a buy cycle (should be 300)
         {
            ClickTimer := 0 
            Goto, FirstUpgrade
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
IniWrite, %CursorCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, CursorCount
IniWrite, %GrandmaCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, GrandmaCount
IniWrite, %FarmCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, FarmCount
IniWrite, %MineCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, MineCount
IniWrite, %FactoryCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, FactoryCount
IniWrite, %BankCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, BankCount
IniWrite, %TempleCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, TempleCount
IniWrite, %WizardTowerCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, WizardTowerCount
IniWrite, %ShipmentCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, ShipmentCount
IniWrite, %AlchemyLabCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, AlchemyLabCount
IniWrite, %PortalCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, PortalCount
IniWrite, %TimeMachineCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, TimeMachineCount
IniWrite, %AntiCondenserCount%, C:\Users\JoeKM\Desktop\Auto Hotkey Scripts\CookieBot\Upgrades.ini, Upgrades, AntiCondenserCount
Return



FirstUpgrade:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, FirstUpgrade, 2358, 176 
      If FirstUpgrade = 0x89aed3
         {
            Click 2374, 196
            UpgradeBoughtThisLoop := 1
         }
      Else                   
         {
            If UpgradeBoughtThisLoop = 1                           ;;If an upgrade was bought this loop reset the counters and move on 
               {
                UpgradeBoughtThisLoop := 0                   
                LoopsSinceUpgrade := 0
                Goto, AntiCondenser
               }
            Else
               {
                  LoopsSinceUpgrade := (LoopsSinceUpgrade+1)       ;; Counts loops since upgrade
                  If LoopsSinceUpgrade > 5                         ;; If its been 5 loops (30 mins) since upgrade, interrupt buy cycle and keep clicking     
                     {
                        Goto, AutoClick
                     }
                  Else Goto, AntiCondenser                          ;; no upgrade this loop, but less than 5 loops, continue buy cycle
               }
         }
   }


AntiCondenser:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, AntiCondenser, 2493, 784
      If AntiCondenser = 0x808f93
         {
           Click 2493, 784
           AntiCondenserCount := (AntiCondenserCount+1)
         }
      Else Goto, TimeMachine
   }

TimeMachine:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, TimeMachine, 2493, 741
      If TimeMachine = 0x9AABAC
         {
           Click 2493, 741
           TimeMachineCount := (TimeMachineCount+1)
         }
      Else Goto, Portal
   }

Portal:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, Portal, 2493, 690
      If Portal = 0x808E92
         {
           Click 2493, 690
           PortalCount := (PortalCount+1)
         }
      Else Goto, AlchemyLab
   }

AlchemyLab:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, AlchemyLab, 2493, 655
      If AlchemyLab = 0x869296
         {
           Click 2493, 655
           AlchemyLabCount := (AlchemyLabCount+1)
         }
      Else Goto, Shipment
   }

Shipment:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, Shipment, 2493, 611
      If Shipment = 0x829495
         {
           Click 2493, 611
           ShipmentCount := (ShipmentCount+1)
         }
      Else Goto, WizardTower
   }

WizardTower:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, WizardTower, 2493, 573
      If WizardTower = 0x9aabaa
         {
           Click 2493, 573
           WizardTowerCount := (WizardTowerCount+1)
         }
      Else Goto, Temple
   }

Temple:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, Temple, 2493, 515
      If Temple = 0x808f92
         {
           Click 2493, 515
           TempleCount := (TempleCount+1)
         }
      Else Goto, Bank
   }

Bank:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, Bank, 2493, 474 
      If Bank = 0x7c8e93
         {
           Click 2493, 474
           BankCount := (BankCount+1)
         }
      Else Goto, Factory
   }

Factory:
Loop 
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, Factory, 2493, 435
      If Factory = 0x7d8f90
         {
           Click 2493, 435
           FactoryCount := (FactoryCount+1)
         }
      Else Goto, Mine
   }

Mine:
Loop
   {
      Click 2347, 507 , 0
      PixelGetColor, Mine, 2493, 393
      If Mine = 0x90a4a9
         {
           Click 2493, 393
           MineCount := (MineCount+1)
         }
      Else Goto, Farm
   }

Farm:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, Farm, 2493, 346
      If Farm = 0x818f93
         {
           Click 2493, 346
           FarmCount := (FarmCount+1)
         }
      Else Goto, Grandma
   }

Grandma:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30 
      PixelGetColor, Grandma, 2493, 307
      If Grandma = 0x7f9095
         {
           Click 2493, 307
           GrandmaCount := (GrandmaCount+1)
         }
      Else Goto, Cursor
   }

Cursor:
Loop
   {
      Click 2347, 507, 0 
      Sleep 30
      PixelGetColor, Cursor, 2493, 267
      If Cursor = 0x829495
         {
           Click 2493, 267
           CursorCount := (CursorCount+1)
         }
      Else Goto, AutoClick
   }