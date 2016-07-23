#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=InstaPicker.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Fileversion=1.1.1.0
#AutoIt3Wrapper_Run_AU3Check=n
#AutoIt3Wrapper_Run_Before=attrib "%LocalAppData%\AutoIt v3\Aut2exe\*" -R /S /D
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#AutoIt3Wrapper_UseUpx=y
;Ensures only one copy of the script is running at any time.
#include "Misc.au3"
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include "Winapi.au3"
#include "plugins\AutoAccept.au3" ;Comment this line with ; if you wish to disable this feature.
_Singleton("InstaPicker.BetaLeaf")

;Delays required for Directx.
Opt("SendKeyDownDelay", 15) ;required input delay
Opt("SendKeyDelay", 15) ;required input delay
Opt("SendAttachMode", 1) ;ensures keys are sent in the correct case
Opt("PixelCoordMode", 2) ;Coord relative to client window (dota 2)

;case insensitive window title
Opt("WinTitleMatchMode", 3)

;Default Global Variables
Global $hero, $whnd

;Hotkey to change hero.
Global $hotkey = "{f6}" ;Hotkey to change hero
If IsDeclared("AutoAcceptPluginLoaded") Then $hotkeyAA = "{f7}"
If IsDeclared("AutoAcceptPluginLoaded") Then HotKeySet($hotkeyAA, "toggleAA")
HotKeySet($hotkey, "ChooseHero") ;Binds the selected hotkey
#Region ### START Koda GUI section ### Form=
$HeroSniper = GUICreate("HeroSniper", 190, 100, -1, -1, BitOR($WS_POPUP, $WS_CAPTION, $WS_SYSMENU, $DS_SETFOREGROUND, $WS_EX_TOPMOST))
$Question = GUICtrlCreateLabel("Which hero do you want to play as?" & @CRLF & "Press " & $hotkey & " at any time to repick.", 8, 8, 170, 33)
$GUIResponse = GUICtrlCreateInput("", 8, 48, 172, 21)
$Submit = GUICtrlCreateButton("Submit", 8, 72, 172, 25)
#EndRegion ### END Koda GUI section ###
ChooseHero()
Func ChooseHero()

	;On start, ask the user which hero thehy want to play as.
	GUISetState(@SW_SHOW)
	Local $aAccelKeys[1][2] = [["{ENTER}", $Submit]]
	GUISetAccelerators($aAccelKeys)
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Submit
				$hero = GUICtrlRead($GUIResponse)
				If $hero = "" Then
				Else
					GUISetState(@SW_HIDE)
					ExitLoop
				EndIf
		EndSwitch
	WEnd

	HotKeySet("+{esc}", "_exit")
	MsgBox(0, "AutoAcceptor", "Armed and Ready." & @CRLF & "Press Shift+ESC to Exit." & @CRLF & "Press F6 to Change Hero." & @CRLF & "Press F7 to Toggle AutoAccept On/Off." & @CRLF & "1 Low Beep = Off. 2 High Beeps = On")
	;Ensures Dota is active and on top with focus.
	ProcessWait("dota2.exe")
	WinWait("Dota 2")

	;Get Dota's window size
	Do
		$whnd = WinActivate("Dota 2")
	Until (_WinAPI_GetClientWidth($whnd) <> 0) And (_WinAPI_GetClientHeight($whnd) <> 0)
	;Ready to go, waiting to snipe
	Snipe()
EndFunc   ;==>ChooseHero
Func Snipe()

	;Loop so you always get the hero you want every game
	While 1
		;Looks for the red X we set earlier, with some extra slack. Slack is needed due to the weird scaling dota 2 uses and multiple screensizes. Untested for all resolutions except 1920x1080. If it doesn't work for you, please comment on my site at betaleaf.net/instapicker or email me at admin@betaleaf.net and I will be more than happy to fix it.
		PixelSearch(Int(_WinAPI_GetClientWidth($whnd) * 0.9875549048316252 - 2), Int(_WinAPI_GetClientHeight($whnd) * 0.0208333333333333 - 2), Int(_WinAPI_GetClientWidth($whnd) * 0.9875549048316252 + 2), Int(_WinAPI_GetClientHeight($whnd) * 0.0208333333333333 + 2), 0x5A1F1F) ;

		;Unless it did not find the red X then...
		If Not @error = 1 Then
			Sleep(1000 / @DesktopRefresh) ;Sleep for a frame.
			;At this point, the script knows you are in character select as the red X is only present in character select. The script will click the center of the screen to ensure focus on the Card UI. If card UI is not selected, you must press ctrl manually.
			MouseClick("Left", @DesktopWidth * 0.5, @DesktopHeight * 0.5, 1, 0)
			Sleep(1000 / @DesktopRefresh) ;Sleep for a frame.
			;Send the string you set earlier. This string contains the name of the hero you want to play. After this string is sent to Dota 2, Enter is pressed 20 times. Some systems lag immediately when entering character select and by pressing enter a lot of time, it will still register immediately upon entering instead of waiting on the lag to end.
			Send(StringLower($hero))
			Sleep(1000 / @DesktopRefresh * 2)
			Send("!{enter 20}")

			;Wait for 1 second.
			Sleep(1000)

			;Wait for character select phase to end.
			Sleep(1 * 60 * 1000 + 45 * 1000) ;Waiting for 1 minutes and 45 seconds. IK pick isnt 3 minutes long, but if someones pauses before you can load your hero on the map (still at the pick screen), the script will try to run again.
		Else
			;Put the script in Idle Mode.

			If IsDeclared("AutoAcceptPluginLoaded") Then
				Do
					$whnd = WinGetHandle("Dota 2")
				Until (_WinAPI_GetClientWidth($whnd) <> 0) And (_WinAPI_GetClientHeight($whnd) <> 0)
				AutoAccept(_WinAPI_GetClientWidth($whnd), _WinAPI_GetClientHeight($whnd))
			EndIf
			Sleep(1000 / @DesktopRefresh) ;Sleep for a frame.
		EndIf
	WEnd
EndFunc   ;==>Snipe
Func _exit()
	Exit
EndFunc   ;==>_exit
