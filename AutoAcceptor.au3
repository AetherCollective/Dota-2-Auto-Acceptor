#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "Plugins\AutoAccept.au3"
#Include "Winapi.au3"
#Include "Misc.au3"
_Singleton("InstaPicker.BetaLeaf")
global $pixel[2]
$hotkeyAA = "{f7}"
HotKeySet($hotkeyAA, "toggleAA")
HotKeySet("+{esc}","_exit")
MsgBox(0,"AutoAcceptor","Armed and Ready."&@crlf&"Press Shift+ESC to Exit. Press F7 to Toggle On/Off."&@CRLF&"1 Low Beep = Off. 2 High Beeps = On")
ProcessWait("dota2.exe")
WinWait("Dota 2")
$whnd = WinActivate("Dota 2")
Sleep(3000)
Do
	$pixel[0] = _WinAPI_GetClientWidth($whnd)
	$pixel[1] = _WinAPI_GetClientHeight($whnd)
Until ($pixel[0] <> 0) And ($pixel[1] <> 0)
While 1
	AutoAccept($pixel[0], $pixel[1])
	Sleep(1000)
WEnd
func _exit()
	Exit
EndFunc