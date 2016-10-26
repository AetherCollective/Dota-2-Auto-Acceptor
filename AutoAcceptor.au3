#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=AutoAcceptor.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "Plugins\AutoAccept.au3"
#include "Winapi.au3"
#include "Misc.au3"
Opt("WinTitleMatchMode", 3)
_Singleton("InstaPicker.BetaLeaf")
$hotkeyAA = "{f7}"
HotKeySet($hotkeyAA, "toggleAA")
HotKeySet("+{esc}", "_exit")
MsgBox(0, "AutoAcceptor", "Armed and Ready." & @CRLF & "Press Shift+ESC to Exit. Press F7 to Toggle On/Off." & @CRLF & "1 Low Beep = Off. 2 High Beeps = On")
While 1
	Select
		Case (ProcessExists("dota2.exe") <> 0) And (WinExists("Dota 2") <> 0)
			Do
				$whnd = WinGetHandle("Dota 2")
			Until (IsDeclared("whnd") <> 0) And (_WinAPI_GetClientWidth($whnd) <> 0) And (_WinAPI_GetClientHeight($whnd) <> 0)
			AutoAccept(_WinAPI_GetClientWidth($whnd), _WinAPI_GetClientHeight($whnd))
			Sleep(500)
		Case Else
			Sleep(5000)
	EndSelect
WEnd
Func _exit()
	Exit
EndFunc   ;==>_exit
