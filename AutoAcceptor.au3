#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=AutoAcceptor.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "Plugins\AutoAccept.au3"
#include "Winapi.au3"
#include "Misc.au3"
_Singleton("InstaPicker.BetaLeaf")
$hotkeyAA = "{f7}"
HotKeySet($hotkeyAA, "toggleAA")
HotKeySet("+{esc}", "_exit")
MsgBox(0, "AutoAcceptor", "Armed and Ready." & @CRLF & "Press Shift+ESC to Exit. Press F7 to Toggle On/Off." & @CRLF & "1 Low Beep = Off. 2 High Beeps = On")
ProcessWait("dota2.exe")
sleep(5000)
WinWait("Dota 2")
Do
	$whnd = WinActivate("Dota 2")
Until (IsDeclared("whnd") <> 0) And (_WinAPI_GetClientWidth($whnd) <> 0) And (_WinAPI_GetClientHeight($whnd) <> 0)
While 1
	AutoAccept(_WinAPI_GetClientWidth($whnd), _WinAPI_GetClientHeight($whnd))
	Sleep(1000)
WEnd
Func _exit()
	Exit
EndFunc   ;==>_exit
